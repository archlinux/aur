# Maintainer: Hemanth Bollamreddi <blmhemu (at) gmail (dot) com>

pkgbase=openaero
pkgname=('openaero-driver-dkms' 'openaero-meta')
pkgver=0.1.0
pkgrel=1
pkgdesc="Entirely open source drivers and utilities for your Gigabyte Aero Laptops on GNU/Linux."
arch=('any')
url="https://github.com/blmhemu/openaero"
license=('GPL2')
makedepends=('python-setuptools')
source=("https://github.com/blmhemu/openaero/releases/download/v$pkgver/openaero-$pkgver.tar.gz")
sha256sums=('ec5b91874b9646c572496363a8d822aac81bed906ec626d8ac51050604a75108')

package_openaero-driver-dkms() {
  pkgdesc="Kernel driver for Aero devices (DKMS-variant)"
  depends=('dkms' 'udev')
  install=openaero-driver-dkms.install

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" setup_dkms udev_install
}

package_openaero-meta() {
  pkgdesc="Meta package for installing all required openaero packages."
  depends=('openaero-driver-dkms')
}
