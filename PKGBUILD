# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>
# Contributor: jul.cgn
_pkgname='chatterino2'
pkgname=${_pkgname}-bin
pkgver=2.5.5
_id=20260426T021422
pkgrel=5
pkgdesc='A chat client for Twitch.tv.'
arch=('x86_64')
url="https://github.com/chatterino/${_pkgname}"
license=('MIT')
depends=(gdk-pixbuf2 glib2 hicolor-icon-theme libnotify openssl
	qt6-{base,imageformats,svg} qtkeychain-qt6 hunspell)
optdepends=('streamlink: For piping streams to video players'
'qt6-wayland: Wayland support')
provides=(chatterino)
conflicts=(chatterino)
options=(!strip) #done
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Chatterino/pkg/releases/download/stable-${_id}/chatterino-arch-linux-${arch}.tar.zst")
sha256sums=('0b8b90ef4a7126387047cb45d3be49c22a7413b04e766639bbb37326a6a43969')

package() {
    install -Dm755 usr/bin/chatterino "${pkgdir}"/usr/bin/chatterino
    install -Dm644 usr/share/applications/com.chatterino.chatterino.desktop "${pkgdir}"/usr/share/applications/com.chatterino.chatterino.desktop
    install -Dm644 usr/share/pixmaps/com.chatterino.chatterino.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/com.chatterino.chatterino.png
    install -Dm644 usr/share/licenses/chatterino/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -d "${pkgdir}"/usr/share/licenses/${_pkgname}
    ln -s /usr/share/licenses/${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
    install -d "${pkgdir}"/usr/share/licenses/chatterino
    ln -s /usr/share/licenses/${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/chatterino/LICENSE
}
