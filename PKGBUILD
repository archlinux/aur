# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.1.1-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.1.1-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.1.1-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.1.1-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('bcf10c2b50b5eda1c2433cb9e8bad2198821a3cf009c2b17d4ebb43286292642')
sha256sums_aarch64=('d0a386129de47c9bfa1b1e42128706f214bf6c809067fe3b101bdbbb94bde16e')
sha256sums_powerpc64le=('ddaaf30a2163a54542fefd638c8a65301833e8b1e245f3117b5874ac517537c8')
sha256sums_riscv64=('74134792e80465841322b1f315ea372480e5faa52b2c140a2a95845411f01a7e')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.1.1-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
