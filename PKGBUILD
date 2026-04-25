# Maintainer: Your Name <your-email@example.com>
pkgname=littlesnitch-bin
pkgver=1.0.5
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

sha256sums_x86_64=('4ae6dd1ea40485889c8a767d32cfcc5649cf1e3b124f2777dc41cb80da4804a6')
sha256sums_aarch64=('07cb99c7076cc1f9f284324ae39bc43ae6ba68c1374c3ae6b47b2e3c41e5540d')
sha256sums_riscv64=('5f9b30b76cc01f7ce63e03278e16f6e72f404ad04a80135767bc74787d4b6dc1')

# The official .pkg.tar.zst extracts directly into the working directory
# with usr/ at the top level. No build step needed.

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
