# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=dealve-tui-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Delve into game deals from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kurama/dealve-tui'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
provides=('dealve-tui' 'dealve')
conflicts=('dealve-tui')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/dealve-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dealve-linux-aarch64")
sha256sums_x86_64=('e94df31b6d0c541854d1f0c51659a7f4aafd5762d38b2bdfea76ce866cf486f1')
sha256sums_aarch64=('1f0a593a25534bd507c40df8bcd41962a7c96d999f47ccec96aa4e95967c74af')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dealve"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/kurama/dealve-tui/blob/main/LICENSE
EOF
}
