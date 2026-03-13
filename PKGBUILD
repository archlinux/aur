# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
pkgver=30.0
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/${pkgname%%-bin}"
license=('Apache-2.0')
options=(staticlibs !strip)
source=(
    "https://github.com/WebAssembly/${pkgname%%-bin}/releases/download/${pkgname%%-bin}-${pkgver%%.*}/${pkgname%%-bin}-${pkgver}-x86_64-linux.tar.gz"
)
b2sums=('7286b9079eeb160b0e033b7802f703b08e089e452c6558f1feb6d9cf8cd240fabea7f9a39d44b13b2793e69a02c569f64520d677d76a577bc2e35ce07c722212')

package() {
    install -d -m 755 "${pkgname%%-bin}-$pkgver-x86_64-linux" "$pkgdir/opt"

    mv "${pkgname%%-bin}-${pkgver}-x86_64-linux" "$pkgdir/opt/${pkgname%%-bin}"
}

