# Maintainer Storm Dragon <stormdragon2976@gmail.com>
# Contributor louipc base64:TG91aSBDaGFuZyA8bG91aXBjLmlzdEBnbWFpbC5jb20+
pkgname="oysttyer-git"
_pkgname="oysttyer"
pkgver=278.ac2c34d
pkgrel=1
pkgdesc="interactive command-line Twitter client"
url="https://github.com/oysttyer/oysttyer"
arch=('any')
depends=('perl')
makedepends=('git')
source=("$pkgname::git+https://github.com/oysttyer/oysttyer.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare()
{
    cd "${srcdir}/${pkgname}"
sed -i 's/^#!\/usr\/bin\/env /#!\/usr\/bin\//' oysttyer.pl
}

package()
{
    cd "${srcdir}/${pkgname}"
    install -Dm755 oysttyer.pl "$pkgdir/usr/bin/oysttyer"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
