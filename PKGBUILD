# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=nvidia-exec
pkgver=0.1.0
pkgrel=4
pkgdesc="Run programs in nvidia optimus setups with power management for Xorg and Wayland without log out"
arch=("x86_64")
url="https://github.com/pedro00dk/nvidia-exec#readme"
license=('GPL')
depends=('NVIDIA-MODULE' 'jq' 'lshw' 'lsof')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pedro00dk/nvidia-exec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('23165c618ee0e19145c141a8b0d7227a2e9bfba48aa7341347b0e286b64cde9d')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 nvx "${pkgdir}/usr/bin/nvx"
    install -Dm 644 nvx.service "${pkgdir}/usr/lib/systemd/system/nvx.service"
    install -Dm 644 nvx-suspend-restore "${pkgdir}/usr/lib/systemd/system-sleep""
    install -Dm 644 modprobe.conf "${pkgdir}/usr/lib/modprobe.d/nvx.conf"
}
