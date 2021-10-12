# Maintainer: Recolic Keghart <root@recolic.net>
# Original repo: https://github.com/recolic/vivado-wrapper

pkgname=vivado-wrapper
pkgver=1.6
pkgrel=1
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
validpgpkeys=("6861D89984E7887F0FFE6E08C344D5EAE3933636")
sha256sums=(
    "SKIP"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin" &&
    cp -r "$pkgname-$pkgver" "$pkgdir/opt/vivado-wrapper" &&
    ln -s "/opt/vivado-wrapper/vivado-wrapper" "$pkgdir/usr/bin/vivadow"
}

