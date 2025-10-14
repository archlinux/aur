# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>
_pkgname=fluentui-system-icons
pkgname="ttf-${_pkgname}"
pkgver=1.1.312
pkgrel=1
pkgdesc="A collection of familiar, friendly and modern icons from Microsoft."
arch=("any")
conflicts=("${pkgname}")
url="https://aka.ms/fluentui-system-icons"
_ghurl="https://github.com/microsoft/fluentui-system-icons"
license=('MIT')
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('94e553cb8fa547cddc139c3cf9b120b668cc89d18ba624dec88200a47a99eac0')
package() {
    find "${srcdir}/${_pkgname}-${pkgver}/fonts" -type f -name "*.ttf" -exec install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" {} +
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
