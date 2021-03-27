# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.60
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=774b8916aa092657c71e854971fe520a7ce508d2
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('03b9d640d7fca1dfd0d35f268c2334e7b1145e05d833d60feb476e5fa7f44ec9')

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
