# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
pkgver=32.0
pkgrel=2
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/${pkgname%%-bin}"
license=('Apache-2.0')
options=(staticlibs !strip)
source=(
    "https://github.com/WebAssembly/${pkgname%%-bin}/releases/download/${pkgname%%-bin}-${pkgver%%.*}/${pkgname%%-bin}-${pkgver}-x86_64-linux.tar.gz"
)
b2sums=('62b83e2db70b24361962b392551c604b21c59535b8d34a5e652447d7b722b033327334f0e17381d28eaa6dcb31fb02aad9978c66b761fb592b6de502012aeb57')

package() {
    install -d -m 755 "${pkgname%%-bin}-$pkgver-x86_64-linux" "$pkgdir/opt"

    mv "${pkgname%%-bin}-${pkgver}-x86_64-linux" "$pkgdir/opt/${pkgname%%-bin}"
}

