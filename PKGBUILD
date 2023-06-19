# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: afward <archlinux.gargoyley@simplelogin.co>
pkgname="yakyak-bin"
pkgver=1.5.12beta
pkgrel=4
pkgdesc="Desktop chat client for Google Hangouts"
arch=('x86_64')
url="https://github.com/yakyak/yakyak"
license=('MIT')
depends=('mesa' 'alsa-lib' 'glibc' 'pango' 'libxcb' 'nss' 'gdk-pixbuf2' 'hicolor-icon-theme' \
  'libxfixes' 'dbus' 'expat' 'cairo' 'gtk3' 'gcc-libs' 'libxshmfence' 'glib2' 'at-spi2-core' 'libcups' \
  'libxkbcommon' 'libxdamage' 'libdrm' 'libxext' 'libxrandr' 'libx11' 'libxcomposite' 'nspr')
optdepends=('noto-fonts-emoji: Emoji support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver%beta}-rolling-beta/${pkgname%-bin}-${pkgver%beta}-beta-linux-x64-pacman.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/yakyak/yakyak/master/LICENSE")
sha256sums=('4b49ce5b110494928e72ae3bee99597920e71ff2a4343729f3eeca55cc8bea3a'
            '30b1618680562dc369ceedff8a25152bffab4f6de902a53e609d4e991c422cc0')

package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}