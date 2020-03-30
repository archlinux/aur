# Maintainer: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=8.0
_pkgver_major=8
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/wasi-sdk"
license=('Apache-2.0')
depends=('clang')
options=('!strip')
source=(
    "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${_pkgver_major}/wasi-sysroot-${pkgver}.tar.gz"
    "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${_pkgver_major}/libclang_rt.builtins-wasm32-wasi-${pkgver}.tar.gz"
)
sha512sums=('6e4d1a23635c569777d2f36d5b06afcfe23fc215b3f0ec563fc7a42b18d576a3e97e526e18c7ec38e0931032b86defcddf45a60934551933c0d418a015757324'
            'b31224946023d8afb0a194514dc5229dbb39417ddb015decf978f891938123948c042dfa7727d983ff07cc8fd1146a7e2a5144deb5dd4cae6f2491d0bc581787')

package() {
    _clang_version=9.0.1
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk" "$pkgdir/usr/lib/clang/${_clang_version}/"

    mv wasi-sysroot "$pkgdir/opt/wasi-sdk/"
    mv lib "$pkgdir/usr/lib/clang/${_clang_version}/"
}
# vim:set ts=2 sw=2 et:

