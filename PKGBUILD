# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=saucer-cli-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A cli program to simplify working with saucer"
arch=('any')
url="https://github.com/saucer/saucer-cli"
license=('MIT')
makedepends=('git' 'cmake' 'ninja')
conflicts=('saucer-cli')
provides=('saucer-cli')
source=("git+https://github.com/saucer/saucer-cli")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/saucer-cli"
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/saucer-cli/build/saucer" "${pkgdir}/usr/bin/saucer"
  mkdir -p "${pkgdir}/usr/bin/"
}
