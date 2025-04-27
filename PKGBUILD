# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname='chatterino2'
pkgname=${_pkgname}-bin
pkgver=2.5.3
_id=20250426T105700
pkgrel=6
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
source=("https://github.com/Chatterino/pkg/releases/download/stable-${_id}/chatterino-arch-linux-${arch}.tar.gz")
sha256sums=('55f557ee73796fbf3dc432b03302362d3c943bf39fd71993555908d9b991e9f2')
package() {
	install -Dm755 chatterino "${pkgdir}"/usr/bin/chatterino
	install -Dm644 {,"${pkgdir}"/usr/share/applications/}com.chatterino.chatterino.desktop
	install -Dm644 icon.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/com.chatterino.chatterino.png
}
