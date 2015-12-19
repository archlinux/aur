# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=binaryen-git
pkgver=20151219
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly, in C++"
arch=(i686 x86_64)
url="https://github.com/WebAssembly/binaryen"
license=('MIT')
depends=()
makedepends=('emscripten' 'git' 'python2')
provides=(binaryen)
conflicts=(binaryen)
source=('git://github.com/WebAssembly/binaryen.git')
md5sums=(SKIP)

build() {
  cd binaryen

  ./build.sh
}

# TODO: Currently broken
# check() {
#   cd binaryen
#
#   python2 check.py
# }

package() {
  cd binaryen

  install -Dm755 bin/asm2wasm ${pkgdir}/usr/bin/asm2wasm
  install -Dm755 bin/binaryen-shell ${pkgdir}/usr/bin/binaryen-shell
  install -Dm755 bin/s2wasm ${pkgdir}/usr/bin/s2wasm
  install -Dm755 bin/wasm2asm ${pkgdir}/usr/bin/wasm2asm
}

# vim:set ts=2 sw=2 et:
