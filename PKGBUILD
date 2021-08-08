# Maintainer: Raymundo Cassani <raymundo.cassani@gmail.com>
# Contributor: Hemanth Bollamreddi <blmhemu@gmail.com>

pkgbase=opengigabyte
pkgname=('opengigabyte-driver-dkms' 'opengigabyte-meta')
pkgver=0.0.2
pkgrel=1
pkgdesc="Entirely open source drivers and utilities for Gigabyte Laptops on GNU/Linux."
arch=('any')
url="https://github.com/blmhemu/opengigabyte"
license=('GPL2')
source=("https://github.com/blmhemu/opengigabyte/archive/v${pkgver}.tar.gz")
md5sums=('3dd0c361f23eae3974abdf0b8af12adc')

package_opengigabyte-driver-dkms() {
  pkgdesc="Kernel driver for Gigabyte devices (DKMS-variant)"
  depends=('dkms' 'udev' 'linux-headers')
  install=opengigabyte-driver-dkms.install

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" setup_dkms udev_install
}

package_opengigabyte-meta() {
  pkgdesc="Meta package for installing all required opengigabyte packages."
  depends=('opengigabyte-driver-dkms')
}

