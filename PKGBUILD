# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=nvidia-exec
pkgver=0.3.2
pkgrel=1
pkgdesc="Run programs in nvidia optimus setups with power management for Xorg and Wayland without log out"
arch=("x86_64")
url="https://github.com/pedro00dk/nvidia-exec#readme"
license=('GPL')
depends=('NVIDIA-MODULE' 'python' 'lshw' 'lsof')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pedro00dk/nvidia-exec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c295ffb9a7510c771455cf293ea52d48646f0ac341a5605444c8a4083fb95765')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 nvx.py "${pkgdir}/usr/bin/nvx"
    install -Dm 644 nvx.service "${pkgdir}/usr/lib/systemd/system/nvx.service"
    install -Dm 644 nvx-modprobe.conf "${pkgdir}/usr/lib/modprobe.d/nvx.conf"
    install -Dm 666 nvx-options.conf "${pkgdir}/etc/nvx.conf"
}
