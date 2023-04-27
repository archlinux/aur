# Maintainer:zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:schorschii https://georg-sieber.de
pkgname=confluence-companion-app-for-linux
pkgver=1.1
pkgrel=1
pkgdesc="Unoffical Atlassian Companion App for Linux."
arch=(any)
url="https://github.com/zxp19821005/Companion4Linux"
license=('GPL')
depends=('python' 'python-websockets' 'python-pyinotify' 'python-wxpython' 'python-requests' 'libnotify' 'python-gobject')
optdepends=('xapp' 'libgexiv2' 'gst-python')
conflicts=("confluence-companion-linux")
provides=()
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.install")
sha256sums=('3303c59aaa85a46f59c0588cbb507b5136cea681696b06360a592b33bdf595a7'
            '65ac8817093a1af0efe66f58129a79989c18e57f47cfa07c3b8ac02a0660d489')

package() {
    install -Dm755 "${srcdir}/Companion4Linux-${pkgver}/"*.py -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/Companion4Linux-${pkgver}/"*.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/Companion4Linux-${pkgver}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/user"
}