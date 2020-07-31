# Maintainer: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.0.4
pkgrel=1
pkgdesc='exFAT filesystem userspace utilities for Linux'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=("exfatprogs-${pkgver}.tar.gz::https://github.com/exfatprogs/exfatprogs/archive/${pkgver}.tar.gz")
sha512sums=('6d01ecc8e70994c1a3e0cedb6dd99d4bd2b50e8e32bc5ca973e302c502001cd5380b7e6c9d62c2f48d9dbac8a641cc23c4f9fc018f8dc6090e762fea785a266d')

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
