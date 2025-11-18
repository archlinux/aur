# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
pkgver=29.0
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/${pkgname%%-bin}"
license=('Apache-2.0')
options=(staticlibs !strip)
source=(
    "https://github.com/WebAssembly/${pkgname%%-bin}/releases/download/${pkgname%%-bin}-${pkgver%%.*}/${pkgname%%-bin}-${pkgver}-x86_64-linux.tar.gz"
)
b2sums=('ba6253ebf56743faa09f85ce67d0814b578973b1c2c8a03f97a082a3a28f5cfaab23d65cae37030dac14f7d6f8ccc811f9ec28970519494da23fcf02e1b4b377')

package() {
    install -d -m 755 "${pkgname%%-bin}-$pkgver-x86_64-linux" "$pkgdir/opt"

    mv "${pkgname%%-bin}-${pkgver}-x86_64-linux" "$pkgdir/opt/${pkgname%%-bin}"
}

