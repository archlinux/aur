# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
pkgver=27.0
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/${pkgname%%-bin}"
license=('Apache-2.0')
options=(staticlibs !strip)
source=(
    "https://github.com/WebAssembly/${pkgname%%-bin}/releases/download/${pkgname%%-bin}-${pkgver%%.*}/${pkgname%%-bin}-${pkgver}-x86_64-linux.tar.gz"
)
b2sums=('768b9d8d66d79c000b11fa0710d1170e6a5f87c20ac8684151b44cce45e5cda83a4c3a4ad09042c4151e40cbf4b9ce0795f0cd5cad30be7b00972a88dc43f7a9')

package() {
    install -d -m 755 "${pkgname%%-bin}-$pkgver-x86_64-linux" "$pkgdir/opt"

    mv "${pkgname%%-bin}-${pkgver}-x86_64-linux" "$pkgdir/opt/${pkgname%%-bin}"
}

