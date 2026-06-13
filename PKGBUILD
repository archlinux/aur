# Maintainer: Foma Shipilov <foma@shipilov.ru>

pkgname=wlnfancurve
pkgver=1.1.0
pkgrel=1
pkgdesc="A small script to control NVIDIA GPU fan speed on Wayland using pyNVML"
arch=("any")
url="https://github.com/xiyori/wlnfancurve"
license=("GPL3")

depends=("python-nvidia-ml-py")

backup=('etc/wlnfancurve.conf')
source=(
  "${pkgname}-${pkgver}::https://github.com/xiyori/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha512sums=('4e29080c7fde3b8e90165f09f4f245c7514b29ce2912860da0e70336a18e3ad63b804c5007d359fdec2a278a8f6fdd4e63bc7f860badc07d4a0cfd0bd2ad0830')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm644 "wlnfancurve.py" "${pkgdir}/usr/bin/wlnfancurve/wlnfancurve.py"
    install -Dm644 "nvml_context.py" "${pkgdir}/usr/bin/wlnfancurve/nvml_context.py"
    install -Dm644 "config" "${pkgdir}/etc/wlnfancurve.conf"
    install -Dm644 "wlnfancurve.service" "${pkgdir}/usr/lib/systemd/system/wlnfancurve.service"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

