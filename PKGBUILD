pkgname=sdupes
pkgver=1.6
pkgrel=1
pkgdesc="fast duplicate file detection"
arch=('x86_64')
license=('GPL3')
url="https://github.com/sph-mn/sdupes"
source=("https://github.com/sph-mn/sdupes/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('gcc')
md5sums=('80816322ff6667140408583ab67a2615')
provides=('sdupes')

build() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile
}

package() {
  cd "${srcdir}/sdupes-$pkgver"
  install -Dm755 "exe/compiled/sdupes" "${pkgdir}/usr/bin/sdupes"
}