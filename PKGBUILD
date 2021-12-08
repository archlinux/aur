# Maintainer: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=14.0
_pkgver_major=14
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/wasi-sdk"
license=('Apache-2.0')
depends=('clang' 'lld')
options=('!strip')
source=(
    "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${_pkgver_major}/wasi-sdk-${pkgver}-linux.tar.gz"
)
sha512sums=('288a367e051f5b3f5853de97fabaedd3acf2255819d50c24f48f573897518500ea808342fd9aea832b2a5717089807bf1cbcf6d46b156b4eb60cc6b3c02ee997')

package() {
    _clang_version=$(clang --version | grep version | cut -d" " -f3)
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk"

    mv wasi-sdk-${pkgver}/* "$pkgdir/opt/wasi-sdk/"
}
# vim:set ts=2 sw=2 et:

