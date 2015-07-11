# Maintainer: Boris Timofeev <mashin87@gmail.com>
pkgname=punes
pkgver=0.94
pkgrel=1
epoch=
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64')
url="http://forums.nesdev.com/viewtopic.php?t=6928"
license=('unknown')
groups=()
depends=('sdl' 'qt4')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://dl.dropbox.com/u/21595068/punes.32bit.tar.gz" "http://dl.dropbox.com/u/21595068/punes.64bit.tar.gz" "punes.desktop" "punes.png")
noextract=()

md5sums=('1375749a03b718e8f8e80d645b66707d'
         'b52f3a4abcbe0d9bfa600069ad6ed58c'
         '3114433444c4a59740b3329937708fc4'
         '2dedec3df0df318df4df835eb90921e6')

package() {
	cd "${srcdir}"
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 punes64 "${pkgdir}/usr/bin/punes"
	else install -Dm755 punes32 "${pkgdir}/usr/bin/punes"
	fi
	install -Dm644 "${srcdir}/punes.desktop" "${pkgdir}/usr/share/applications/punes.desktop"
	install -Dm644 "${srcdir}/punes.png" "${pkgdir}/usr/share/pixmaps/punes.png"
}

# vim:set ts=2 sw=2 et:
