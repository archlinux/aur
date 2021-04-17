# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.66
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=4db483d652bcc8c2e80e73a0de486560377866e0
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('b9768cff7e5a170d5646dd1e1e04f247e9d86a5e30c020c75d518fe7b4aaf2bf')

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
