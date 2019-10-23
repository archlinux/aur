# Maintainer: Hemanth Bollamreddi <blmhemu (at) gmail (dot) com>

pkgbase=openaero
pkgname=('openaero-driver-dkms' 'openaero-meta')
pkgver=0.1.1
pkgrel=1
pkgdesc="Entirely open source drivers and utilities for your Gigabyte Aero Laptops on GNU/Linux."
arch=('any')
url="https://github.com/blmhemu/openaero"
license=('GPL2')
makedepends=('python-setuptools')
source=("https://github.com/blmhemu/openaero/archive/v$pkgver.tar.gz")
sha256sums=('e79d5288236723b2bbcaf9c219b3f2f0e3486d8e23ab477cb769828733558eea')

package_openaero-driver-dkms() {
  pkgdesc="Kernel driver for Aero devices (DKMS-variant)"
  depends=('dkms' 'udev' 'linux-headers')
  install=openaero-driver-dkms.install

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" setup_dkms udev_install
}

package_openaero-meta() {
  pkgdesc="Meta package for installing all required openaero packages."
  depends=('openaero-driver-dkms')
}
