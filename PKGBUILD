# Maintainer: Simon Scatton <simon.scatton@outlook.fr>

pkgname=rationl
pkgver=0.1.0
pkgrel=1
pkgdesc="An expressive and fast regular expression library for C"
arch=('any')
url="https://github.com/TheNaturLFoundation/rationl"
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
checkdepends=('criterion')
provides=('rationl')
conflicts=()
source=("https://github.com/TheNaturLFoundation/rationl/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=("36b711ed2c4dc6b462ed7702115a4db66aa014d2adacf8f2fed636a3eb253378de73e2d3e4a9d5e963daeb6d6b2503e8236b74e1e43cf9db84534ee7cc917a19")

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix="/usr"
  make
}

check() {
  cd $pkgname-v$pkgver
  make check
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
}
