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
source=("https://github.com/blmhemu/openaero/archive/v$pkgver.tar.gz")
sha256sums=('97a9c0b81202dda8154b7ba0b998975548ed68492ad2ea287c12122643fc368c')

package_openaero-driver-dkms() {
  pkgdesc="Kernel driver for Aero devices (DKMS-variant)"
  depends=('dkms' 'udev')
  install=openaero-driver-dkms.install

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" setup_dkms udev_install
}11

package_openaero-meta() {
  pkgdesc="Meta package for installing all required openaero packages."
  depends=('openaero-driver-dkms')
}
