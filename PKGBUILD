pkgname=sdupes
pkgver=1.5
pkgrel=1
pkgdesc="Fast duplicate file detection"
arch=('x86_64')
license=('GPL3')
url="https://github.com/sph-mn/sdupes"
source=("https://github.com/sph-mn/sdupes/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('gcc')
md5sums=('964b5e43037ffa7dd9112dbab70a118f')
provides=('sdupes')

build() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile
}

package() {
  cd "${srcdir}/sdupes-$pkgver"
  install -Dm755 "exe/sdupes" "${pkgdir}/usr/bin/sdupes"
}