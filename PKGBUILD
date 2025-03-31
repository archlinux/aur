# Maintainer: Arnab Bose <hirak99+arch@gmail.com>

pkgname=keyshift
pkgver=1.0.12
pkgrel=1
pkgdesc="Keyshift - keyboard remapping utility for Linux"
arch=('any')
url="https://github.com/hirak99/$pkgname"
license=('Apache')
depends=()
makedepends=()

source=(
  "$pkgname::git+https://github.com/hirak99/keyshift.git#tag=v$pkgver"
)
md5sums=(
  'SKIP'
)

options=(!debug)

prepare() {
  cd "$pkgname"
  cd ./src/thirdparty
  # Extract digestpp.
  git submodule update --init --recursive
}

package() {
  cd "$pkgname"
  ./build_minimal.sh

  install -Dm 755 ./build/keyshift "$pkgdir"/usr/bin/keyshift
}

