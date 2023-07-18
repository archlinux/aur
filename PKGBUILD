# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="postbird-bin"
pkgver=0.8.4
pkgrel=1
pkgdesc="Open source PostgreSQL GUI client for macOS, Linux and Windows"
arch=('x86_64')
url="https://github.com/Paxa/postbird"
license=('MIT')
depends=('hicolor-icon-theme' 'libxdamage' 'alsa-lib' 'libxss' 'libxtst' 'gtk3' 'at-spi2-core' 'glib2' 'expat' 'libxrandr' \
    'libxcb' 'libx11' 'glibc' 'libxext' 'libcups' 'cairo' 'gcc-libs' 'libxi' 'pango' 'libxfixes' 'dbus' 'libxrender' 'nss' \
    'util-linux-libs' 'gdk-pixbuf2' 'nspr' 'libxcursor' 'libxcomposite')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/${pkgver}/Postbird-${pkgver}.pacman"
  "LICENSE::https://raw.githubusercontent.com/Paxa/postbird/master/LICENSE")
sha256sums=('e3cc9eb893a35ddd0cc93ca10e526957c9c04896044a3b7c0f445daad45adfea'
            'd93e84fa24bbea7e92d6cd171968d8da1f4a28047cc704f0700d17b57c7a9a9c')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}