# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=nvidia-exec
pkgver=0.2.3
pkgrel=1
pkgdesc="Run programs in nvidia optimus setups with power management for Xorg and Wayland without log out"
arch=("x86_64")
url="https://github.com/pedro00dk/nvidia-exec#readme"
license=('GPL')
depends=('NVIDIA-MODULE' 'python' 'lshw' 'lsof')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pedro00dk/nvidia-exec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4501a9bb1761ee8506f88645766078b4923ac6dd895bd44179bc91b438e5be11')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 nvx.py "${pkgdir}/usr/bin/nvx"
    install -Dm 644 nvx.service "${pkgdir}/usr/lib/systemd/system/nvx.service"
    install -Dm 644 nvx-modprobe.conf "${pkgdir}/usr/lib/modprobe.d/nvx.conf"
    install -Dm 666 nvx-options.conf "${pkgdir}/etc/nvx.conf"
}
