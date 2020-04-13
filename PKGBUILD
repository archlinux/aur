# Maintainer: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=10.0
_pkgver_major=10
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/wasi-sdk"
license=('Apache-2.0')
depends=('clang' 'lld')
options=('!strip')
source=(
    "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${_pkgver_major}/wasi-sysroot-${pkgver}.tar.gz"
    "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${_pkgver_major}/libclang_rt.builtins-wasm32-wasi-${pkgver}.tar.gz"
)
sha512sums=('768074d7dcc769d03ed35aef73bb5c5c01272fddc4943e03a7d7e933da28104b119b0c9af7f14c59f3786ee37d0b385e6239f558d86d1be1cef9b8871b19c22e'
            '5501477a6fb5ab5c98f40dff76a3f8da1e3ad62881e456ef2665410248f2d4c2c45f3722ca3706efef2b219e6c17ecb4aa3221d84d44017f17388320db525692')

package() {
    _clang_version=9.0.1
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk" "$pkgdir/usr/lib/clang/${_clang_version}/"

    mv wasi-sysroot "$pkgdir/opt/wasi-sdk/"
    mv lib "$pkgdir/usr/lib/clang/${_clang_version}/"
}
# vim:set ts=2 sw=2 et:

