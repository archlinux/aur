# Maintainer: Carlos Prieto <prietus@live.com>

pkgname=livefetch-bin
_pkgname=livefetch
pkgver=0.1.0
pkgrel=1
pkgdesc="Animated fastfetch-style system info with a live refreshing dashboard"
arch=('x86_64')
url="https://github.com/prietus/livefetch"
license=('MIT')
depends=('libwebp' 'gcc-libs')
optdepends=(
    'pciutils: GPU detection'
    'iproute2: local IP detection'
    'lm_sensors: CPU temperature on systems without hwmon labels'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('4e5acf30afab2eb21275da0b26e5acb97cdcf52966f13167dc38686ae3e80842')

package() {
    cd "${_pkgname}-v${pkgver}-linux-x86_64"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
