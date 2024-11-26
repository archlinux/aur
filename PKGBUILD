# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batman-alfred
pkgver=2024.3
pkgrel=1
pkgdesc='Almighty Lightweight Fact Remote Exchange Daemon'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL-2.0-only')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/alfred-${pkgver}.tar.gz")
sha256sums=('d7114338c1a064695af71d58de03677a7219b07c55429b80f86dc03c0249ffea')
depends=('glibc' 'gpsd' 'libnl' 'libcap')

build(){
  cd "${srcdir}/alfred-${pkgver}"
  make
}

package() {
  cd "${srcdir}/alfred-${pkgver}"
  make DESTDIR="${pkgdir}"  PREFIX=/usr SBINDIR=/usr/bin install
}

