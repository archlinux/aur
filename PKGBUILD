# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=quamachi
_filename_=Quamachi
pkgver=0.7.0
pkgrel=2
pkgdesc="A Hamachi GUI for Linux"
arch=("any")
url="http://${_filename_}.Xavion.name"
license=("LGPL3")
depends=("pyqt" "logmein-hamachi>=2")
optdepends=("mtr: A ping GUI"
			"putty: An SSH GUI"
			"gksu: A SU(do) GUI"
			"terminal: A shell GUI"
			"vinagre: A VNC client GUI")
install="${_filename_}.install"
source=(http://prdownloads.sourceforge.net/${pkgname}/${_filename_}-${pkgver}.tar.bz2)

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

sha1sums=('74aec7977f2fdccb60235bb37f6cdf0797c39886')
