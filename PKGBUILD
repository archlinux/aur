# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="polar-bin"
pkgver=2.0.0
pkgrel=3
pkgdesc="One-click Bitcoin Lightning networks for local app development & testing"
arch=("x86_64")
url="https://lightningpolar.com/"
_githuburl="https://github.com/jamaljsr/polar"
license=('MIT')
depends=('libxdamage' 'glib2' 'alsa-lib' 'libxfixes' 'libxrandr' 'expat' 'gdk-pixbuf2' 'cairo' 'libxshmfence' 'libcups' 'pango' 'glibc' \
    'libxkbcommon' 'nspr' 'libx11' 'mesa' 'libdrm' 'nss' 'libxcomposite' 'libxext' 'gtk3' 'dbus' 'at-spi2-core' 'hicolor-icon-theme' \
    'libxcb' 'gcc-libs' 'docker')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-V${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/jamaljsr/polar/master/LICENSE")
sha256sums=('d35a9a194d9cc77d945a8b6de7e89cf7f12f5e51a2c6b76b8b9d0d38ef477828'
            '971e947b52af09847d493b326953f2cbc91669441eab0d5e74eac38b8e162904')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --uname root --gname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}