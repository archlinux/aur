# Maintainer: Foma Shipilov <foma@shipilov.ru>

pkgname=wlnfancurve
pkgver=1.0.1
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
sha512sums=('7746504da4a67602652728290c106e575913346e8c53cb28f04256f5f35f536c7053ae740b812879e53fa50534391c5124bed43b30f9a1b68a639944d9c34063')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm644 "wlnfancurve.py" "${pkgdir}/usr/bin/wlnfancurve/wlnfancurve.py"
    install -Dm644 "nvml_context.py" "${pkgdir}/usr/bin/wlnfancurve/nvml_context.py"
    install -Dm644 "config" "${pkgdir}/etc/wlnfancurve.conf"
    install -Dm644 "wlnfancurve.service" "${pkgdir}/usr/lib/systemd/system/wlnfancurve.service"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

