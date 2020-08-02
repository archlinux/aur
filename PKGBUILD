# Maintainer: Ashley <ashley dot ruglys at gmail dot com>

_appname=wasm-bindgen
pkgname=wasm-bindgen-bin
pkgver=0.2.67
pkgrel=1
pkgdesc="Interoperating JS and Rust code (binary builds)"
arch=('x86_64')
provides=("wasm-bindgen")
conflicts=("wasm-bindgen" "wasm-bindgen-git")
url="https://github.com/rustwasm/wasm-bindgen"
license=('Apache' 'MIT')
_urlbase="${url}/releases/download"
_buildname="wasm-bindgen-${pkgver}-x86_64-unknown-linux-musl"

source=(
  "${url}/releases/download/${pkgver}/${_buildname}.tar.gz"
)

sha256sums=('SKIP')

package(){
  install -D -m755 "${srcdir}/${_buildname}/wasm-bindgen" "$pkgdir/usr/bin/wasm-bindgen"
  install -D -m755 "${srcdir}/${_buildname}/wasm-bindgen-test-runner" "$pkgdir/usr/bin/wasm-bindgen-test-runner"
  install -D -m755 "${srcdir}/${_buildname}/wasm2es6js" "$pkgdir/usr/bin/wasm2es6js"
}
