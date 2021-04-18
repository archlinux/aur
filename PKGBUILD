# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.69
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=d5db36951bd0a7d0f2c19657c652ab37a94f56a3
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog' 'libseccomp')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('e698813dd225b4a4337a54e13d390bc2222c8b24d150b84354b77de0c563c109')

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
