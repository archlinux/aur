# Maintainer: Recolic Keghart <root@recolic.net>
# Original repo: https://github.com/recolic/vivado-wrapper

pkgname=vivado-wrapper
pkgver=1.3
pkgrel=0
pkgdesc="Wrap vivado as a simple project manager, which works in shell command line natively."
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
    "473a268b8f237e9816ff3e40bde269c6fe069f9dc18ec8edcd82f85621a848e0"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin" &&
    cp -r "$pkgname-$pkgver" "$pkgdir/opt/vivado-wrapper" &&
    ln -s "/opt/vivado-wrapper/vivado-wrapper" "$pkgdir/usr/bin/vivadow"
}

