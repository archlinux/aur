# Maintainer: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
pkgver=19.0
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/${pkgname%%-bin}"
license=('Apache-2.0')
depends=('clang' 'lld')
options=('!strip')
source=(
    "https://github.com/WebAssembly/${pkgname%%-bin}/releases/download/${pkgname%%-bin}-${pkgver%%.*}/${pkgname%%-bin}-${pkgver}-linux.tar.gz"
)
sha512sums=('949aa57d2f3049d8df29515e062c47145f2898552a396a438ef52460206e68928dae00882868cd7a546cc67429a0e6d368b87f381d77d395101e2aab0fc7f4f9')

package() {
    _clang_version=$(clang --version | grep version | cut -d" " -f3)
    cd $srcdir
    mkdir -p "$pkgdir/opt/${pkgname%%-bin}"

    mv ${pkgname%%-bin}-${pkgver}/* "$pkgdir/opt/${pkgname%%-bin}/"
}
# vim:set ts=2 sw=2 et:

