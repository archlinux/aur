# Maintainer: taotieren <admin@taotieren.com>

pkgbase=fastnet-bin
pkgname=fastnet-bin
_name=${pkgname%-bin}
pkgver=0.7.6
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
source=("https://fw0.koolcenter.com/binary/fastnet/${_name}-binary-raw-${pkgver}.tar.gz")
sha256sums=('98a4272ea1b086f7ff7ef09e666283f4e37eb6b8c6ede8ba5d4ca87cf5f2b361')
options=(!debug !strip)

package() {
    cd "${srcdir}/${_name}-binary-raw-${pkgver}/"
    if [ ${CARCH} = "x86_64" ]; then
        install -vDm755 ${_name}.x86_64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "aarch64" ]; then
        install -vDm755 ${_name}.aarch64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "armv7h" ]; then
        install -vDm755 ${_name}.arm ${pkgdir}/usr/bin/${_name}
    fi
}
