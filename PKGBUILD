# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>
# Contributor: jul.cgn
_pkgname='chatterino2'
pkgname=${_pkgname}-bin
pkgver=2.5.3
_id=20250801T012940
pkgrel=16
pkgdesc='A chat client for Twitch.tv.'
arch=('x86_64')
url="https://github.com/chatterino/${_pkgname}"
license=('MIT')
depends=(gdk-pixbuf2 glib2 hicolor-icon-theme libnotify openssl
	qt6-{base,5compat,imageformats,svg} qtkeychain-qt6)
optdepends=('streamlink: For piping streams to video players'
'qt6-wayland: Wayland support')
provides=(chatterino)
conflicts=(chatterino)
options=(!strip) #done
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Chatterino/pkg/releases/download/stable-${_id}/chatterino-arch-linux-${arch}.tar.zst")
sha256sums=('3a8eae0f09345d34798d50b240b1dd04a2e80f7f1be88346ac3d9b46d6bd85bf')

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
