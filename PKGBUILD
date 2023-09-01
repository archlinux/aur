# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=nvidia-exec
pkgver=0.1.2
pkgrel=1
pkgdesc="Run programs in nvidia optimus setups with power management for Xorg and Wayland without log out"
arch=("x86_64")
url="https://github.com/pedro00dk/nvidia-exec#readme"
license=('GPL')
depends=('NVIDIA-MODULE' 'jq' 'lshw' 'lsof')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pedro00dk/nvidia-exec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('98f065268423c69e3bb01e8dc08f097d9b348c7ba39ba026724ab8962442ed73')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 nvx "${pkgdir}/usr/bin/nvx"
    install -Dm 644 nvx.service "${pkgdir}/usr/lib/systemd/system/nvx.service"
    install -Dm 644 modprobe.conf "${pkgdir}/usr/lib/modprobe.d/nvx.conf"
}
