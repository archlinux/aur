pkgname=sdupes
pkgver=1.7
pkgrel=1
pkgdesc="fast duplicate file detection"
arch=('x86_64')
license=('GPL3')
url="https://github.com/sph-mn/sdupes"
source=("https://github.com/sph-mn/sdupes/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('gcc')
md5sums=('d55d43e2e72ee8e9fb4f36095d7a4244')
provides=('sdupes')

build() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile
}

package() {
  cd "${srcdir}/sdupes-$pkgver"
  install -Dm755 "exe/compiled/sdupes" "${pkgdir}/usr/bin/sdupes"
}