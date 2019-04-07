# Maintainer: Francesco Allara <me@francescoallara.it>

pkgname=ufsd-pro-tools
pkgver=9.6.7
pkgrel=1
pkgdesc='Paragon NTFS & HFS for Linux tools. Pro version.'
arch=('i686' 'x86_64')
url='http://paragon-software.com/'
license=('custom')
depends=('linux-lts')
makedepends=('linux-lts-headers')
provides=('ntfsprogs')
conflicts=('ntfsprogs')
srcfile="file://Paragon-715-PRE_NTFS_Linux_${pkgver}_Pro.tar.gz"

source=("${srcfile}")
md5sums=('5e836a598960bc8a8b4ddebaae3a49a5')

prepare() {
  cd "${srcdir}"
  ./configure 
  cd linutil
  make retail_util
}

package() {
  install -d -m755 ${pkgdir}/usr/bin
  cp -RL ${srcdir}/linutil/objfre/bin/* ${pkgdir}/usr/bin
}