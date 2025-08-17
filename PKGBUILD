# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

_pkgname='chatterino2-nightly'
pkgname="${_pkgname}-bin"
_id=20250817T010908
_ver=2.5.3
pkgver=${_ver}.${_id}
pkgrel=1
pkgdesc='A chat client for Twitch.tv. (Nightly build)'
arch=('x86_64')
url="https://github.com/chatterino/chatterino2"
license=('MIT')
depends=(gdk-pixbuf2 glib2 hicolor-icon-theme libglvnd libnotify openssl
		qt6-{base,5compat,imageformats,svg} qtkeychain-qt6)
optdepends=('streamlink: For piping streams to video players'
'qt6-wayland: Wayland support')
provides=(chatterino)
conflicts=(chatterino)
options=(!strip) #done
source=("${pkgname}-${pkgver}.tar.zst::https://github.com/Chatterino/pkg/releases/download/nightly-${_id}/chatterino-arch-linux-${arch}.tar.zst")
sha256sums=('03664154704832d790dae844644437755cc5caa15ecb4edf8c7c03f49236c829')
package() {
    install -Dm755 usr/bin/chatterino "${pkgdir}"/usr/bin/chatterino
    install -Dm644 usr/share/applications/com.chatterino.chatterino.desktop "${pkgdir}"/usr/share/applications/com.chatterino.chatterino.desktop
    install -Dm644 usr/share/pixmaps/com.chatterino.chatterino.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/com.chatterino.chatterino.png
    install -Dm644 usr/share/licenses/chatterino/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -d "${pkgdir}"/usr/share/licenses/chatterino
    ln -s /usr/share/licenses/${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/chatterino/LICENSE
}
