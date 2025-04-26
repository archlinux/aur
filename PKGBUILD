# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname='chatterino2-nightly'
pkgname="${_pkgname}-bin"
_id=20250426T120229
_ver=2.5.3
pkgver=${_ver}.${_id}
pkgrel=1
pkgdesc='A chat client for Twitch.tv. (Nightly build)'
arch=('x86_64')
url="https://github.com/chatterino/chatterino2"
license=('MIT')
depends=(gdk-pixbuf2 glib2 hicolor-icon-theme libglvnd libnotify openssl
		qt6-{base,5compat,imageformats,svg} qtkeychain-qt6)

optdepends=('streamlink: For piping streams to video players')
provides=(chatterino)
conflicts=(chatterino)
source=("https://github.com/Chatterino/pkg/releases/download/nightly-${_id}/chatterino-arch-linux-${arch}.tar.gz")
#source=("https://github.com/Chatterino/pkg/releases/download/nightly-${_id}/"{chatterino-arch-linux-$arch,com.chatterino.chatterino.desktop,icon.png})
sha256sums=('9cee3bd9dfdc97775733d33b2459b36bbb61781850eca20a62f8ca356ecce2bc')
package() {
	install -Dm755 chatterino "${pkgdir}"/usr/bin/chatterino
	install -Dm644 {,"${pkgdir}"/usr/share/applications/}com.chatterino.chatterino.desktop
	install -Dm644 icon.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/com.chatterino.chatterino.png
}
