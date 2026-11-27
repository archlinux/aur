# Maintainer: taotieren <admin@taotieren.com>

pkgbase=fastnet-bin
pkgname=fastnet-bin
_name=FastNet
pkgver=0.8.10
pkgrel=1
pkgdesc="FastNet -- Goal: Make a full-platform speed measurement software! - TUI"
arch=($CARCH)
url="https://www.koolcenter.com/t/topic/9148"
license=('LicenseRef-fastnet')
provides=(${pkgbase%-bin})
conflicts=(${pkgbase%-bin})
depends=()
makedepends=()
optdepends=()
source=("https://fw0.koolcenter.com/binary/fastnet/${pkgname%-bin}-binary-raw-${pkgver}.tar.gz")
sha256sums=('e6a51e3927e8d7e1bd1154985a0d35ae0131ea4c5eee3b419049cba525c52bcf')
options=(!debug !strip)

package() {
    cd "${srcdir}/${pkgname%-bin}-binary-raw-${pkgver}/"
    if [ ${CARCH} = "x86_64" ]; then
        install -vDm755 ${_name}.x86_64 ${pkgdir}/usr/bin/${pkgname%-bin}
    elif [ ${CARCH} = "aarch64" ]; then
        install -vDm755 ${_name}.aarch64 ${pkgdir}/usr/bin/${pkgname%-bin}
    elif [ ${CARCH} = "armv7h" ]; then
        install -vDm755 ${_name}.arm ${pkgdir}/usr/bin/${pkgname%-bin}
    fi
}
