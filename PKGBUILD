# Maintainer: Harrison <contact@htv04.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname='facetimehd-firmware'
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='Firmware for the FacetimeHD (Broadcom 1570) PCIe webcam'
arch=('any')
url='https://github.com/patjak/facetimehd-firmware'
license=('unknown')
makedepends=('git' 'curl' 'xz' 'cpio')
conflicts=("$pkgname" 'bcwc-pcie-firmware')
replaces=("$pkgname" 'bcwc-pcie-firmware')
provides=("$pkgname" 'bcwc-pcie-firmware')

source=("$pkgname::git+https://github.com/patjak/facetimehd-firmware.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  install -Dm644 "$srcdir/$pkgname/firmware.bin" "$pkgdir/usr/lib/firmware/facetimehd/firmware.bin"
}
