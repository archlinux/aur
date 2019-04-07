# Maintainer: Francesco Allara <me@francescoallara.it>
# Based on: ufsd-module-dkms

pkgname=ufsd-pro-dkms
pkgver=9.6.7
srcfile="file://Paragon-715-PRE_NTFS_Linux_${pkgver}_Pro.tar.gz"
pkgrel=1
pkgdesc='Paragon NTFS & HFS for Linux driver. Pro version.'
arch=('i686' 'x86_64')
url='http://paragon-software.com/'
license=('custom')
depends=('linux-lts')
makedepends=('linux-lts-headers')
provides=('ntfs-3g')
conflicts=('ntfs-3g')

source=("${srcfile}")
md5sums=('5e836a598960bc8a8b4ddebaae3a49a5')

package() {
  install -dm755 ${pkgdir}/usr/src/${pkgname}-${pkgver}
  sed "s/@VERSION@/$pkgver/" ${srcdir}/util/paragon-dkms.conf > ${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf
  cp -RL ${srcdir}/* ${pkgdir}/usr/src/${pkgname}-${pkgver}
}