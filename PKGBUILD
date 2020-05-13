# Maintainer: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.0.3
pkgrel=1
pkgdesc='exFAT filesystem userspace utilities for Linux'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=("exfatprogs-${pkgver}.tar.gz::https://github.com/exfatprogs/exfatprogs/archive/${pkgver}.tar.gz")
sha512sums=('faafab72e126c10be2f8d52bc1c81d0d9b1a24145f56ef50698eb84261e2111e8db1ebb2851e7cd826577e060a7c6a4f16337de4bca54d11e0aa3658a2677df3')

build() {
  cd exfatprogs-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd exfatprogs-${pkgver}
  make DESTDIR="${pkgdir}" install
#  install -Dm644 */*.8 -t "${pkgdir}"/usr/share/man/man8
}
