# Maintainer: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=16.0
_pkgver_major=16
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
sha512sums=('81470dbc3f33b806f81a2f345e547d778ccee7a7359ec5121fae32909644c20f1d425c09cda67cb784332a57e2fecd3f08f375835d3b001799e77b565e30e899')

package() {
    _clang_version=$(clang --version | grep version | cut -d" " -f3)
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk"

    mv wasi-sdk-${pkgver}/* "$pkgdir/opt/wasi-sdk/"
}
# vim:set ts=2 sw=2 et:

