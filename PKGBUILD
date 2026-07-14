# Maintainer: Your Name <your-email@example.com>
pkgname=littlesnitch-bin
pkgver=1.1.0
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

sha256sums_x86_64=('618f41e8ab7f7a3ff5b50d53240bd4eed3c16aff3fdab4ebc0a308cdf17b2088')
sha256sums_aarch64=('55029bf90fd7a13cf86dccb01d51f5543ccc768b43f17f5068d5b8a73089e476')
sha256sums_riscv64=('7a78313d630ea4490aede9a7c9987bcc7f05864329e477c30accff0d8bac8720')

# The official .pkg.tar.zst extracts directly into the working directory
# with usr/ at the top level. No build step needed.

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
