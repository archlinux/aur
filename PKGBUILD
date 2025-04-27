# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Maintainer: Rasmus Karlsson
# Maintainer: oech3
_pkgname='chatterino2-nightly'
pkgname="${_pkgname}-bin"
_id=20250427T143129
_ver=2.5.3
pkgver=${_ver}.${_id}
pkgrel=3
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
source=("https://github.com/Chatterino/pkg/releases/download/nightly-${_id}/chatterino-arch-linux-${arch}.tar.zst")
sha256sums=('2b2b59aff143e2a2ad558fd9960cebad7c7c8d365ffa8b7961811f3c43d0829a')
package() {
    install -Dm755 usr/bin/chatterino "${pkgdir}"/usr/bin/chatterino
    install -Dm644 usr/share/applications/com.chatterino.chatterino.desktop "${pkgdir}"/usr/share/applications/com.chatterino.chatterino.desktop
    install -Dm644 usr/share/pixmaps/com.chatterino.chatterino.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/com.chatterino.chatterino.png
}
