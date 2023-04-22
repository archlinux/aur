# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="kahla-bin"
pkgver=4.5.0
pkgrel=3
pkgdesc="Kahla is a cross-platform business messaging app."
arch=("x86_64")
url="https://www.kahla.app/"
_githuburl="https://github.com/AiursoftWeb/Kahla.App"
license=('MIT')
depends=('at-spi2-core' 'gtk3' 'nss' 'alsa-lib' 'libxss' 'libxcursor' 'libxrender' 'libcups' 'libxtst' \
    'libxext' 'cairo' 'gcc-libs' 'nspr' 'libxi' 'pango' 'libx11' 'hicolor-icon-theme' 'dbus' 'libxfixes' \
    'libxrandr' 'libxcb' 'libxcomposite' 'glib2' 'expat' 'gdk-pixbuf2' 'libxdamage' 'glibc')
options=(!strip)
optdepends=()
provides=("AiursoftWeb")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('937672471cd111e8136d819db3e59707d97356c02585b88fca84beab46c8209b'
            '2f5e2140f19b9216cb3fecd147f935586c806c54b2edcdf5521f535237a1c3f7')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's|Utility|Utility;Network|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}