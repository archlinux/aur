# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="bcwc-pcie-firmware"
pkgver=1.43.0
pkgrel=1
pkgdesc="Firmware for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')
makedepends=('cpio' 'git')

source=("$pkgname::git+https://github.com/patjak/bcwc_pcie.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname/firmware"
  make
}

package() {
  install -Dm 644 "$srcdir/$pkgname/firmware/firmware.bin" \
    "$pkgdir/usr/lib/firmware/facetimehd/firmware.bin"
}
