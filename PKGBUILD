# Maintainer: Aria Quinlan <hello@aria.coffee>
pkgname=mo-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A Markdown viewer that opens .md files in a browser with live-reload'
arch=('x86_64' 'aarch64')
url='https://github.com/k1LoW/mo'
license=('MIT')
provides=('mo')
conflicts=('mo')

source_x86_64=("${url}/releases/download/v${pkgver}/mo_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/mo_v${pkgver}_linux_arm64.tar.gz")

# TODO: Update these after downloading and running: sha256sum mo_v0.21.0_linux_*.tar.gz
sha256sums_x86_64=('243e3a8fa08dfec69d8bcb8260a4f7e14d3b68d1bef01e18d8ca370121555c40')
sha256sums_aarch64=('cc337d133db788cf34646af3e01d2952b46b1fcebca6e3be06c7d9503d905d4b')

package() {
    install -Dm755 mo "${pkgdir}/usr/bin/mo"

    # Install license if present in the tarball
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
