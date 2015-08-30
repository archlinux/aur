# Maintainer: Sebastien Duthil <duthils@free.fr>

# Note: I can't test on x86, feel free to drop me an email/comment with the
# working PKGBUILD for x86

pkgname=blackvoxel
pkgver=1.39
pkgrel=2
pkgdesc="Game of automation and programming in a voxel world"
arch=('x86_64')
url='http://www.blackvoxel.com/'
license=('GPL3')
depends=('glew' 'gcc-libs-multilib' 'sdl' 'hicolor-icon-theme')
install="${pkgname}.install"
source=("${pkgname}_source_1_39.tar.bz2::${url}/dm_download.php?file=74")
sha256sums=('0bf8e6b9729fee481d8f4e5bcc791f005b3a5ff8152cdc602fe2a6197bf17bca')

build() {
	cd "${srcdir}/${pkgname}_source_1_39"
	make blackvoxeldatadir="/usr/share/${pkgname}/"
}

package() {
	cd "${srcdir}/${pkgname}_source_1_39"
	make install \
		specialinstall=true \
		DESTDIR="${pkgdir}/" \
		bindir="usr/bin/" \
		blackvoxeldatadir="usr/share/${pkgname}/" \
		icondir2="usr/share/icons/" \
		desktopdir="usr/share/applications/"
}
