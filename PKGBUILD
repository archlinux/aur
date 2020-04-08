# Maintainer: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=9.0
_pkgver_major=9
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
sha512sums=('a10f2441754d497c03d80577e71bf12b92d7e08f06a46b0a0d5ed9728eb10206de3c9cab412b632168bb4026dc2e5b0791ba3a99ad0c94971da4f8b6f09d6f42'
            'aa06125eee9e89a46b9dbfec8426a0c99aaf341e69eefd7443854beb266843f1cc69ad905c442e59d38a06fba3af2a6f6fed084f656d0c931f296780986425e6')

package() {
    _clang_version=9.0.1
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk" "$pkgdir/usr/lib/clang/${_clang_version}/"

    mv wasi-sysroot "$pkgdir/opt/wasi-sdk/"
    mv lib "$pkgdir/usr/lib/clang/${_clang_version}/"
}
# vim:set ts=2 sw=2 et:

