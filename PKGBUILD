# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
pkgver=33.0
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/${pkgname%%-bin}"
license=('Apache-2.0')
options=(staticlibs !strip)
source=(
    "https://github.com/WebAssembly/${pkgname%%-bin}/releases/download/${pkgname%%-bin}-${pkgver%%.*}/${pkgname%%-bin}-${pkgver}-x86_64-linux.tar.gz"
)
b2sums=('62e8075f7517f6396f417fba52a1c062fd22a9222b6e93916def184fe079a9233f77f25c813e65a22a58bb656f08461c2402cc0d3c1eb06ec6e1d64e3d269254')

package() {
    install -d -m 755 "${pkgname%%-bin}-$pkgver-x86_64-linux" "$pkgdir/opt"

    mv "${pkgname%%-bin}-${pkgver}-x86_64-linux" "$pkgdir/opt/${pkgname%%-bin}"
}

