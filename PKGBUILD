# Contributor louipc base64:TG91aSBDaGFuZyA8bG91aXBjLmlzdEBnbWFpbC5jb20+
pkgname="oysttyer-git"
pkgver=134.c6ff39e
pkgrel=1
pkgdesc="interactive command-line Twitter client"
url="https://github.com/oysttyer/oysttyer"
arch=('any')
depends=('perl')
source=("$pkgname::git+https://github.com/oysttyer/oysttyer.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 oysttyer.pl "$pkgdir/usr/bin/oysttyer"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
