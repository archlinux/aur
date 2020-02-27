# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=wasmtime-bin
pkgver=0.12.0
pkgrel=0
pkgdesc='Standalone JIT-style runtime for WebAssembly, using Cranelift'
provides=('wasmtime' 'wasm2obj')
conflicts=('wasmtime')
arch=('x86_64')
url="https://wasmtime.dev/"
license=(Apache)
_pkgname=wasmtime
_repo=https://github.com/bytecodealliance/$_pkgname
_download=${_repo}/releases/download/v${pkgver}
source=(
  ${_download}/wasmtime-v${pkgver}-x86_64-linux.tar.xz
)
sha512sums=(
  SKIP
)

package() {
  cd "$srcdir"/wasmtime-v${pkgver}-x86_64-linux
  install -Dm755 wasmtime "$pkgdir"/usr/bin/wasmtime
  install -Dm755 wasm2obj "$pkgdir"/usr/bin/wasm2obj
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
