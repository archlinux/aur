# Maintainer: Your Name <your-email@example.com>
pkgname=littlesnitch-bin
pkgver=1.0.6
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

sha256sums_x86_64=('58be5938b02358c605edc03a16eb4fc01e1f164a113de16cb4a36e8b48ef2824')
sha256sums_aarch64=('c77bacb0b1efd36e8909318884accddd9cff06d020b3e4af853dc646e01cf082')
sha256sums_riscv64=('a9013aec05f0392d3d84a665e8d7813f5e5049ba4e03e74631bda66a73a4a353')

# The official .pkg.tar.zst extracts directly into the working directory
# with usr/ at the top level. No build step needed.

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
