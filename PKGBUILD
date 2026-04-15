# Maintainer: taotieren <admin@taotieren.com>

pkgbase=fastnet-bin
pkgname=fastnet-bin
_name=${pkgname%-bin}
pkgver=0.7.3
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
source=("https://fw0.koolcenter.com/binary/fastnet/${_name}-binary-${pkgver}.tar.gz")
sha256sums=('23cdfb1421ca446952974c644c02f24c234f0782b5f021dab3ca3114707bc7fc')
options=(!debug !strip)

package() {
    cd "${srcdir}/${_name}-binary-${pkgver}/"
    if [ ${CARCH} = "x86_64" ]; then
        install -vDm755 ${_name}.x86_64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "aarch64" ]; then
        install -vDm755 ${_name}.aarch64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "armv7h" ]; then
        install -vDm755 ${_name}.arm ${pkgdir}/usr/bin/${_name}
    fi
}
