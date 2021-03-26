# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.55
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=23ee071493192cbc54c1f194ff1e2336354f15a6
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('3b8a10538914ce811284a770c3b26b74621c338a7f07da357193dac937ba7b03')

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
