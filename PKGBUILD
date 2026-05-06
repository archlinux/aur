# Maintainer: Your Name <your-email@example.com>
pkgname=littlesnitch-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="Little Snitch for Linux — monitors and controls outgoing network connections using eBPF"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://obdev.at/products/littlesnitch-linux/index.html"
license=('GPL-2.0-only' 'LicenseRef-proprietary')
depends=('systemd')
provides=('littlesnitch')
conflicts=('littlesnitch')
backup=()
install=littlesnitch.install

source_x86_64=("https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst")
source_riscv64=("https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-${pkgrel}-riscv64.pkg.tar.zst")

sha256sums_x86_64=('1365e01f057e81a650f8a049c98dcb5e44348f440a6477889adadb08bb134bad')
sha256sums_aarch64=('3bfa50eeb7273a4beedbe72a928e4cce8ac9b03f651cf326b7346cd13c634ba3')
sha256sums_riscv64=('2bf7d9e495569e3f3c2de3b9d2a7ba881442ede110527228c449cad7769b6be2')

# The official .pkg.tar.zst extracts directly into the working directory
# with usr/ at the top level. No build step needed.

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
