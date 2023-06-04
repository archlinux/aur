# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlectron-gui-bin
pkgver=1.38.0
pkgrel=1
pkgdesc="A simple and lightweight SQL client desktop with cross database and platform support."
arch=('x86_64')
url="https://sqlectron.github.io/"
_githuburl="https://github.com/sqlectron/sqlectron-gui"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('pango' 'libcups' 'libxcomposite' 'hicolor-icon-theme' 'libdrm' 'libxkbcommon' 'nss' 'libxdamage' 'gdk-pixbuf2' 'gtk3' \
    'nspr' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glibc' 'libxcb' 'libx11' 'libxext' 'libxrandr' 'libxfixes' 'bash' 'libxshmfence' \
    'glib2' 'at-spi2-core' 'mesa' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-gui-bin}-${pkgver}.pacman"
    "LICENSE::https://raw.githubusercontent.com/sqlectron/sqlectron-gui/main/LICENSE")
sha256sums=('17eb28d4f4e34f619471f71edc68de5768791549e3313295d98f4cd2a991b6ff'
            '87b56cd5c7ac2bbf995ae64079519a228e20d86b15a16a75fa109c7611bb1e19')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}