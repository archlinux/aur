# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=pmbw
pkgver=0.6.3
pkgrel=1
pkgdesc="Parallel Memory Bandwidth Benchmark / Measurement"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://panthema.net/2013/${pkgname}/"
license=('GPL')
source=("https://github.com/bingmann/${pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
md5sums=('25a7465ec6327f5beff49586397e5014')

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
