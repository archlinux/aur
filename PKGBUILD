# Maintainer: Paco Pascal <me@pacopascal.com>
_pkgname=chicken-marks
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc=""
arch=($CARCH)
url='https://github.com/FragmentedCurve/chicken-marks'
license=('BSD')
depends=(openssl)
makedepends=(chicken openssl)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://github.com/FragmentedCurve/chicken-marks.git')
md5sums=('SKIP')

build() {
    cd "$_pkgname"
    make eggs
    make CHICKEN_CSC=chicken-csc
}

package() {
    cd "$_pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    install marks "$pkgdir/usr/bin/"
}
