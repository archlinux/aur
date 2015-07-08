# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=pmbw
pkgver=0.6.2
pkgrel=1
pkgdesc="Parallel Memory Bandwidth Benchmark / Measurement"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://panthema.net/2013/${pkgname}/"
license=('GPL')
depends=()
makedepends=('')
source=("https://panthema.net/2013/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0a63f24a2168a9373a3d7679ce93c3e0')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
