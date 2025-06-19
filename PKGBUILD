# Maintainer: Raymundo Cassani <raymundo.cassani@gmail.com>
# Contributor: Hemanth Bollamreddi <blmhemu@gmail.com>

pkgname=opengigabyte
pkgver=0.0.2
pkgrel=1
pkgdesc="Kernel driver for Gigabyte devices (DKMS-variant)"
arch=('any')
url="https://github.com/blmhemu/opengigabyte"
license=('GPL-2.0-or-later')
depends=('dkms' 'udev' 'linux-headers')
install=opengigabyte-driver-dkms.install
source=("https://github.com/blmhemu/opengigabyte/archive/v${pkgver}.tar.gz")
md5sums=('3dd0c361f23eae3974abdf0b8af12adc')

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" setup_dkms udev_install
}


