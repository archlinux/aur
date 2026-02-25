# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=dockmate-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Docker and Podman TUI manager for terminal productivity'
arch=('x86_64' 'aarch64')
url='https://github.com/shubh-io/DockMate'
license=('MIT')
provides=('dockmate')
conflicts=('dockmate')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/dockmate-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dockmate-linux-arm64")
sha256sums_x86_64=('fe8b8e14c7550e48d844f0ae5fcbf4c92f560e3396aa7396341fbd894919edd6')
sha256sums_aarch64=('b1275c1f0c1d9ba58eb345ce95b27bf0e0f78925212cff34de3eed33a75d51cb')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dockmate"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/shubh-io/DockMate/blob/main/LICENSE
EOF
}
