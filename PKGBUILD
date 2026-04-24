# Maintainer: czyt <czytcn@gmail.com>
pkgname=little-snitch-bin
pkgver=1.0.4
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
sha256sums_x86_64=('3104e73859c2e72b88206ebf2e7e239a157ed154eb12f3972fb570285d52aec9')
sha256sums_aarch64=('cd724f59c9b0dd3f7822e2013897e07ff94be04cc5ca10a9c854300d7755eb96')
sha256sums_ppc64le=('2c6534330fd8009971663931a57bcd39215a5a95c995c22042aaa0e0d6546217')
sha256sums_riscv64=('c943541b236bee7c5af939acc73a3cd0b3a341ac7238dc249d37ea18dd183e24')

package() {
    # Extract the pacman package directly
    tar -xf "${srcdir}/littlesnitch-${pkgver}-1-${CARCH}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.INSTALL'

    # Install license
    install -Dm644 "${pkgdir}/usr/share/doc/littlesnitch/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
