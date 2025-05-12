# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=blackvoxel
pkgver=2.5
pkgrel=1
pkgdesc="Game of automation and programming in a voxel world"
arch=('x86_64')
url='https://www.blackvoxel.com/'
license=('GPL-3.0-or-later')
depends=('glew' 'hicolor-icon-theme' 'mesa' 'sdl')
_srcdir="${pkgname}_source_2_50"
source=("${pkgname}-${pkgver}.tar.bz2::${url}/dm_download.php?file=170&key=1")
sha256sums=('357fc6f4be66401b52fbbf3db8ab7b4293a3e7b3332a01f99c990d1ec36c6996')

_datadir="/usr/share/games/${pkgname}"

build() {
	cd "${_srcdir}"
	make BV_DATA_LOCATION_DIR="${_datadir}" installable
}

package() {
	cd "${_srcdir}"
	make install \
		doinstall=true \
		DESTDIR="${pkgdir}" \
		BV_DATA_INSTALL_DIR="${_datadir}" \
		BV_BINARY_INSTALL_DIR='/usr/bin' \
		icondir2='/usr/share/icons/' \
		desktopdir='/usr/share/applications/'
}
