# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=fcronq
_filename_=FcronQ
pkgver=0.5.0
pkgrel=1
pkgdesc="An Fcron GUI"
url="https://${_filename_}.Xavion.name"
arch=("any")
license=("GPL3")
depends=("python-pyqt5" "fcron>=3.1")
optdepends=("gksu: A SU(do) GUI"
			"terminal: A shell GUI")
install="${_filename_}.install"
source=(https://prdownloads.sourceforge.net/${pkgname}/${_filename_}-${pkgver}.tar.bz2)

build() {
	cd "${srcdir}"/${_filename_}/Build

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

sha1sums=('9c8eb946d1a65b73dd7194af649986d59a598d54')
