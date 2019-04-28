# Maintainer: Recolic Keghart <root@recolic.net>
# Original repo: https://github.com/recolic/vivado-wrapper

pkgname=vivado-wrapper
pkgver=1.5
pkgrel=0
pkgdesc="Wrap vivado as a simple project manager, which works in linux command line natively."
url="https://github.com/recolic/$pkgname"
license=("GPL3")
arch=("any")
depends=("bash" "findutils")
install="$pkgname.install"
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/v$pkgver/v$pkgver.tar.gz.sig"
)
validpgpkeys=("8A260D8ABBEBEF75855FEFDF7C3D13CDCA5C947F")
sha256sums=(
    "3519d7cbec49cd80e68672e14ef063f8a981e563c9b4d862ebb2c65d3dd20b43"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin" &&
    cp -r "$pkgname-$pkgver" "$pkgdir/opt/vivado-wrapper" &&
    ln -s "/opt/vivado-wrapper/vivado-wrapper" "$pkgdir/usr/bin/vivadow"
}

