# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='wasmtime-bin'
pkgver='0.21.0'
pkgrel='1'
pkgdesc='Standalone JIT-style runtime for WebAssembly, using Cranelift'
provides=('wasmtime' 'wasm2obj')
conflicts=('wasmtime')
arch=('x86_64')
url="https://wasmtime.dev/"
license=('Apache')
_repo='https://github.com/bytecodealliance/wasmtime'
_download="$_repo/releases/download/v$pkgver"
source=(
  "${_download}/wasmtime-v${pkgver}-x86_64-linux.tar.xz"
)
sha512sums=(
  'SKIP'
)

package() {
  cd "$srcdir/wasmtime-v${pkgver}-x86_64-linux"
  install -Dm755 wasmtime "$pkgdir/usr/bin/wasmtime"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
