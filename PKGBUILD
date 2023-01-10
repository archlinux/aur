# Maintainer: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=17.0
_pkgver_major=17
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
sha512sums=('4d2ff0e55c427a3aefd57e9a19a35513f3a31cb73740880ef297f8c0fa402e31e6b1b91eee4cdb24cbb266c325df8d4b53d17ebc29c7b5529ba6e3f83a4ea1f0')

package() {
    _clang_version=$(clang --version | grep version | cut -d" " -f3)
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk"

    mv wasi-sdk-${pkgver}/* "$pkgdir/opt/wasi-sdk/"
}
# vim:set ts=2 sw=2 et:

