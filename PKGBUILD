# Maintainer: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
pkgver=20.0
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
sha512sums=('ff3d368267526887534f50767ff010bd368e9c24178ab2f0cf57a8ed0b3a82fbf85986d620ab2327ac6bb3f456c65adc6edb80626a1289e630dde7e43b191b42')

package() {
    _clang_version=$(clang --version | grep version | cut -d" " -f3)
    cd $srcdir
    mkdir -p "$pkgdir/opt/${pkgname%%-bin}"

    mv ${pkgname%%-bin}-${pkgver}/* "$pkgdir/opt/${pkgname%%-bin}/"
}
# vim:set ts=2 sw=2 et:

