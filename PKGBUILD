# Maintainer: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.0.2
pkgrel=2
pkgdesc='exFAT filesystem userspace utilities for Linux'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=("exfatprogs-${pkgver}.tar.gz::https://github.com/exfatprogs/exfatprogs/archive/${pkgver}.tar.gz")
sha512sums=('f44661039c1b924ec3f5e32bae3c33cb0f9983230bfd9f5a31e57b801f2e179d1d284b90b5e8a88b9a0b168d1efd017b2d99f9f967055c799f413322b1acaa55')

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
