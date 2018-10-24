# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.1.1
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64' 'armv7h' 'armv6h')
depends=('glibc' 'libogg')
makedepends=('gcc' 'make')

source=("https://github.com/fmang/opustags/archive/$pkgver.tar.gz")
sha1sums=('a89c694915ba400cd7dc547c69f592d9202bd6d7')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/usr" install
}
