# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>
_pkgname=fluentui-system-icons
pkgname="ttf-${_pkgname}"
pkgver=1.1.306
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
sha256sums=('924a547ba4ad37055d7f0f779c0dbcfd89446443a108a303b1a5fc94d7931d3d')
package() {
    find "${srcdir}/${_pkgname}-${pkgver}/fonts" -type f -name "*.ttf" -exec install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" {} +
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
