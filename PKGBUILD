# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.54
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=016705600d4d3b6188675386ed8e7622063d3326
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('ae28bb65d92e2b1a81389c36704158a5b48f42643ab1f575711d5b6c05afa39b')

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
