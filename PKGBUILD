# Maintainer: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.0.2
pkgrel=1
pkgdesc='exFAT filesystem userspace utilities for Linux'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=("exfatprogs-${pkgver}.tar.gz::https://github.com/exfatprogs/exfatprogs/archive/${pkgver}.tar.gz")
sha512sums=('922454bd3d2e26dcc12d4219a2f94a4dc36784a9c5eed345217fe0aaab6ef06a32bdbe9deb8c3ea1fa0f078590059f93efc884cf3db58023f190c4c29b2a47fe')

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
