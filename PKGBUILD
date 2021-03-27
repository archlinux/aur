# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.59
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=665cb29fb76ec8bda513386602cdc6fdcc56da5e
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('74b5a7180a99fc8c38c218e8d7fab4e5471146a496c861d593bb7bc28e3e53b7')

build() {
  cd "$srcdir/tcg-$commit"
  mkdir -p build
  cd build
  cmake ..
  make -j
}

package() {
  cd "$srcdir/tcg-$commit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm4755 build/tcg "${pkgdir}/usr/bin/tcg"
}
