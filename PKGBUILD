# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deckboard-bin
_appname=Deckboard
pkgver=2.1.4
pkgrel=1
pkgdesc="Control your PC with your phone in easy way possible."
arch=('i686' 'x86_64')
url="https://deckboard.app/"
_githuburl="https://github.com/rivafarabi/deckboard"
license=('custom')
conflits=("${pkgname%-bin}")
depends=('libxss' 'libxfixes' 'nspr' 'libglvnd' 'dbus' 'alsa-lib' 'gdk-pixbuf2' 'expat' 'util-linux-libs' 'libxdamage' 'libxrandr' \
    'gcc-libs' 'libx11' 'libcups' 'libxext' 'libxi' 'cairo' 'libxcursor' 'libxcb' 'glib2' 'gtk3' 'libxcomposite' 'pango' 'nss' \
    'at-spi2-core' 'libxrender' 'libxtst' 'glibc' 'hicolor-icon-theme')
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_i686=('ea948e3972eff67d346405814195e1351fefd2ccc6b4feb0175fc6faad06bda7')
sha256sums_x86_64=('d765627ec6cdfb834823aa81e0840c1b82f357584a493cbb0dfb05a5c6332367')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}