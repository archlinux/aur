# Maintainer: Paweł Lidwin <linguin@tutanota.com>

pkgname=jelly-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple community made desktop client for Jellyfin"
arch=('x86_64')
url="https://github.com/imLinguin/jelly-desktop"
license=('GPL3')
conflicts=(${pkgname%-*}-{appimage,electron})
_filename=jelly-desktop-${pkgver}.pacman
noextract=(${_filename})
source=(${url}/releases/download/v${pkgver}/${_filename})
md5sums=('e49d7c7457191ab09f67dd0bce9fc139')
options=(!strip)

package() {
	tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/Jelly\ Desktop/jelly-desktop" "$pkgdir/usr/bin/jelly-desktop"
}
