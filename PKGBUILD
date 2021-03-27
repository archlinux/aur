# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg-git
pkgver=0.2.58
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
url="https://github.com/zasdfgbnm/tcg"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "$srcdir/tcg"
  mkdir -p build
  cd build
  cmake ..
  make -j
}

package() {
  cd "$srcdir/tcg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm4755 build/tcg "${pkgdir}/usr/bin/tcg"
}
