# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=q7z
_filename_=Q7Z
pkgver=0.9.1
pkgrel=2
pkgdesc="An alternative 7-Zip GUI - replaced by the 'j7z' package"
arch=("any")
url="http://${_filename_}.Xavion.name"
license=("LGPL3")
depends=("pyqt" "p7zip" "tar")
optdepends=("p7zip-gui: The GUI component of P7Zip"
			"xz-utils: Supports XZ archives"
			"bzip2: Supports BZip2 archives"
			"gzip: Supports GZip archives")
conflicts=("k7z")
replaces=("k7z")
install="${_filename_}.install"
source=(http://prdownloads.sourceforge.net/k7z/${_filename_}-${pkgver}.tar.bz2)

build() {
	cd "${srcdir}"/${_filename_}/Build

	# Messages
	warning "This application was replaced by J7Z; you should use the 'j7z' package instead."
	read -p "==> QUESTION: Do you wish to continue building this package despite its deprecated status? [y/N] " -n 1
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		echo ""
		return 1
	fi

	#make uninstall
	#make clean
	make
}

package() {
	cd "${srcdir}"/${_filename_}/Build

	make DESTDIR="${pkgdir}" install

	# Messages
	msg "Seek further information or send feedback via the 'Help' menu."
}

sha1sums=('d6571cd7fe5acdb7863d50dad6700feefc534276')
