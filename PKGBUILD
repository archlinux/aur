# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname='chatterino2'
pkgname=${_pkgname}-bin
pkgver=2.5.3
_id=20250426T115837
pkgrel=5
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
source=("https://github.com/chatterino/pkg/releases/download/stable-${_id}/"{chatterino-arch-linux-$arch,com.chatterino.chatterino.desktop,icon.png})
sha256sums=('4e5b750afc51e551eeda437cabc52829944284cbfefd4471834983df99b52f8d'
            'ef9f358f1d8c89b10c32e8621e9fac7b5aca89c9f5e439243ada92ecd537b7c7'
            'a13a8534a328baa480257dd5aeb5c7f6e610ee8c5a10f638327a0078ff466d35')
package() {
	install -Dm755 chatterino-arch-linux-${arch} "${pkgdir}"/usr/bin/chatterino
	install -Dm644 {,"${pkgdir}"/usr/share/applications/}com.chatterino.chatterino.desktop
	install -Dm644 icon.png "${pkgdir}"/usr/share/icon/hicolor/256x256/apps/com.chatterino.chatterino.png
}
