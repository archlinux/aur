# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=dealve-tui-bin
pkgver=1.0.2
pkgrel=2
pkgdesc='Delve into game deals from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kurama/dealve-tui'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
provides=('dealve-tui' 'dealve')
conflicts=('dealve-tui')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/dealve-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dealve-linux-aarch64")
sha256sums_x86_64=('02eb8afd10f117403a7ebd11301990d7be653c247c1bdbf584ffdfd5594c5a4d')
sha256sums_aarch64=('9b1f75da26ccb8bb2217a430e84fcbe0b01c72b6e0c55e1b59c090233cc2727f')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dealve"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/kurama/dealve-tui/blob/main/LICENSE
EOF
}
