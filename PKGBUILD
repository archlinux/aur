# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="autographa-bin"
pkgver=2.4.0
pkgrel=2
pkgdesc="A Bible translation editor for everyone."
arch=("x86_64")
url="https://github.com/friendsofagape/autographa"
license=('MIT')
depends=('pango' 'libdrm' 'dbus' 'libxext' 'gtk3' 'nspr' 'wayland' 'mesa' 'hicolor-icon-theme' 'alsa-lib' 'libcups' 'expat' 'gcc-libs' 'nss' \
    'cairo' 'glibc' 'libx11' 'libxdamage' 'libxrandr' 'libxfixes' 'libxkbcommon' 'libxcb' 'at-spi2-core' 'glib2' 'libxcomposite')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    LICENSE::https://raw.githubusercontent.com/friendsofagape/autographa/development/LICENSE)
sha256sums=('f069d16802fa9962d76aecf180d754b72e0170c166f944e873cc09ecc3aa89b8'
            'e99335f7bac3e61f2ea60e3e6fe8a0f37d8e3c79872a6067e8d72c86754cad0f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}