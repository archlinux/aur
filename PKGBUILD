# Maintainer: czyt <czytcn@gmail.com>
pkgname=little-snitch-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Little Snitch for Linux - monitors outgoing network connections and lets you decide which applications are allowed to connect to the internet"
arch=('x86_64' 'aarch64' 'ppc64le' 'riscv64')
url="https://obdev.at/products/littlesnitch"
license=('GPL-2.0-only' 'custom')
depends=('pam' 'sqlite' 'gcc-libs' 'libaudit' 'libcap-ng')
provides=('littlesnitch')
conflicts=('littlesnitch')
install=little-snitch-bin.install
options=('!strip')
source_x86_64=("littlesnitch-${pkgver}-1-x86_64.pkg.tar.zst::https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-1-x86_64.pkg.tar.zst")
source_aarch64=("littlesnitch-${pkgver}-1-aarch64.pkg.tar.zst::https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-1-aarch64.pkg.tar.zst")
source_ppc64le=("littlesnitch-${pkgver}-1-ppc64le.pkg.tar.zst::https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-1-ppc64le.pkg.tar.zst")
source_riscv64=("littlesnitch-${pkgver}-1-riscv64.pkg.tar.zst::https://obdev.at/downloads/littlesnitch-linux/littlesnitch-${pkgver}-1-riscv64.pkg.tar.zst")
sha256sums_x86_64=('618f41e8ab7f7a3ff5b50d53240bd4eed3c16aff3fdab4ebc0a308cdf17b2088')
sha256sums_aarch64=('55029bf90fd7a13cf86dccb01d51f5543ccc768b43f17f5068d5b8a73089e476')
sha256sums_ppc64le=('0cc58e022c2e1ce74c13277c24483c21a85ebd054e01fc0ff9fffb4cf608e770')
sha256sums_riscv64=('7a78313d630ea4490aede9a7c9987bcc7f05864329e477c30accff0d8bac8720')

package() {
    # Extract the pacman package directly
    tar -xf "${srcdir}/littlesnitch-${pkgver}-1-${CARCH}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.INSTALL'

    # Install license
    install -Dm644 "${pkgdir}/usr/share/doc/littlesnitch/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
