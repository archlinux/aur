# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.56
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=996d2573dade0a4d55909a3a97a10ac71efa0db0
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('6058737c099a6a36062cd0a5f75cc10b2ae310e01724eb2863327721c1d89dd5')

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
