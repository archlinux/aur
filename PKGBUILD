# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.53
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=a760bdea2f939cd9e95571da3f86a2c6d444e46b
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('f416e87bb6cb02b7e4960ce2caaa15a2779e70ddeb288f2edabeb9e7e7e41f7f')

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
