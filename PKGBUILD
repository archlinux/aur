# Maintainer: Arvedui <arvedui@posteo.de>
pkgname=radicale-imap-git
pkgver=r1.04c9baf
pkgrel=1
pkgdesc="IMAP auth for radicale"
arch=("any")
url="https://github.com/Unrud/RadicaleIMAP"
license=('GPL')
groups=()
depends=('python' 'radicale')
makedepends=('git')
options=(!emptydirs)
source=("git+https://github.com/Unrud/RadicaleIMAP")
md5sums=("SKIP")

pkgver() {
    cd ${srcdir}/RadicaleIMAP
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/RadicaleIMAP"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
