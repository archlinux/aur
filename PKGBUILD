# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=blackvoxel
pkgver=2.42
pkgrel=1
pkgdesc="Game of automation and programming in a voxel world"
arch=('x86_64')
url='http://www.blackvoxel.com/'
license=('GPL3')
depends=('glew' 'hicolor-icon-theme' 'mesa' 'sdl')
install="${pkgname}.install"
_srcdir="${pkgname}_source_2_42"
source=("${pkgname}-${pkgver}.tar.bz2::${url}/dm_download.php?file=163&key=1")
sha256sums=('379a89ff60df0e397920b35c10629a5f4c77a4fc6343bf544dfbbf8dd7353ee6')

build() {
	cd "${_srcdir}"
	make blackvoxeldatadir="/usr/share/${pkgname}/"
}

package() {
	cd "${_srcdir}"
	make install \
		specialinstall=true \
		DESTDIR="${pkgdir}/" \
		bindir="usr/bin/" \
		blackvoxeldatadir="usr/share/${pkgname}/" \
		icondir2="usr/share/icons/" \
		desktopdir="usr/share/applications/"
}
