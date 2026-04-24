# Maintainer: Your Name <your-email@example.com>
pkgname=littlesnitch-bin
pkgver=1.0.4
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

sha256sums_x86_64=('3104e73859c2e72b88206ebf2e7e239a157ed154eb12f3972fb570285d52aec9')
sha256sums_aarch64=('cd724f59c9b0dd3f7822e2013897e07ff94be04cc5ca10a9c854300d7755eb96')
sha256sums_riscv64=('c943541b236bee7c5af939acc73a3cd0b3a341ac7238dc249d37ea18dd183e24')

# The official .pkg.tar.zst extracts directly into the working directory
# with usr/ at the top level. No build step needed.

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
