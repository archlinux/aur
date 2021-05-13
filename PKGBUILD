# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=quamachi
_filename_=Quamachi
pkgver=0.8.0
pkgrel=1
pkgdesc="A Hamachi GUI for Linux"
url="https://${_filename_}.Xavion.name"
arch=("any")
license=("LGPL3")
depends=("python-pyqt5" "logmein-hamachi>=2.1")
optdepends=("mtr: A ping GUI"
			"putty: An SSH GUI"
			"gksu: A SU(do) GUI"
			"terminal: A shell GUI"
			"vinagre: A VNC client GUI")
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

	make DESTDIR="${pkgdir}" Sys-SBin="/usr/bin" install

	# Messages
	msg "Seek further information or send feedback via the 'Help' menu."
}

sha1sums=('73c6ac7e3901c8ebba86abf9bf8d68c6e5b4c66a')
