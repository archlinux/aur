# Maintainer: Your Name <your-email@example.com>
pkgname=littlesnitch-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Little Snitch for Linux — monitors and controls outgoing network connections using eBPF"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://obdev.at/littlesnitch-linux"
license=('GPL-2.0-only' 'LicenseRef-proprietary')
depends=('systemd')
provides=('littlesnitch')
conflicts=('littlesnitch')
backup=()
install=littlesnitch.install

source_x86_64=("https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst")
source_riscv64=("https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-${pkgrel}-riscv64.pkg.tar.zst")

sha256sums_x86_64=('be4db2862502a6aadd738905141d5570ed49fc23e20c33083fc57c0a7452452f')
sha256sums_aarch64=('fc5b552608b99d779fd5846164951b70ed4380476a8084b185890e3bd167aba5')
sha256sums_riscv64=('52dcfce7d1562e3c9535397901ce72519ce42dfd3718de889772a1bde6c6d1ff')

# The official .pkg.tar.zst extracts directly into the working directory
# with usr/ at the top level. No build step needed.

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
