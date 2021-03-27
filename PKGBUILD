# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.61
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=1a4a652665366e8b42b8092413dc4ed4cfc27c08
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('8661587062e3142f741f3ec77577030d961cc9f6ed6578d1464f3088d71cfea2')

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
