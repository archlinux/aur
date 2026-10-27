# Maintainer: taotieren <admin@taotieren.com>

pkgbase=fastnet-bin
pkgname=fastnet-bin
_name=FastNet
pkgver=0.7.8
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
sha256sums=('e2fe3b3050ee9f5ae84a0f548de7bb9e39655f5ded5fd4d1255369cf62f84735')
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
