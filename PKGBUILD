# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.65
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=f74934d4cdbbff4102e43648f94d39915abe1b8b
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('319076211a8dd0b0a0950dfc1fafc427989a995e2488fe097914e45f82061086')

build() {
  cd "$srcdir/tcg-$commit"
  mkdir -p build
  cd build
  cmake -DVERSION=${pkgver} ..
  make -j
}

package() {
  cd "$srcdir/tcg-$commit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm4755 build/tcg "${pkgdir}/usr/bin/tcg"
}
