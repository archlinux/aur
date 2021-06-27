# Maintainer: taotieren <admin@taotieren.com>

pkgname=gd32-isp-console-bin
pkgver=v1.0.1.3411
pkgrel=2
pkgdesc="GigaDevice MCU ISP Console for Linux"
arch=('any')
url="http://www.gd32mcu.com"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=()
makedepends=('unarchiver')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${url}/data/documents/yingyongruanjian/GD32_ISP_Console_${pkgver}.rar"
        ${pkgname}.install)
sha256sums=('51ef69b1be37beb67f1eae4d4d5c03deef6d48198b1e0105d8c7edb29c42168c'
            'e91208b4418a7cc73b7059a822658ef0cd08327ec87d0176b95b94d44c2121b9')

noextract=("GD32_ISP_Console_${pkgver}.rar")

package() {
    install -dm0755 "${pkgdir}/opt/GD32" \
                    "${pkgdir}/usr/bin"

    unar -e GBK "${srcdir}/GD32_ISP_Console_${pkgver}.rar" -o "${pkgdir}/opt/GD32"

    cd "${pkgdir}/opt/GD32/GD32 ISP Console"
    chmod 0755 GD32_ISP_Console execute.sh

    ln -sf "/opt/GD32/GD32 ISP Console/GD32_ISP_Console" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
