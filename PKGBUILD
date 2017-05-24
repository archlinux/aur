# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="facetimehd-firmware"
pkgver=1.43.0
pkgrel=1
pkgdesc="Firmware for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/facetimehd-firmware"
license=('unknown')
makedepends=('cpio' 'curl' 'git' 'xz')
conflicts=('bcwc-pcie-firmware')
replaces=('bcwc-pcie-firmware')
provides=('bcwc-pcie-firmware')

source=("$pkgname::git+https://github.com/patjak/facetimehd-firmware.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  install -Dm 644 "$srcdir/$pkgname/firmware.bin" \
    "$pkgdir/usr/lib/firmware/facetimehd/firmware.bin"
}
