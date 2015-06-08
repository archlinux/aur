# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=fcronq
_filename_=FcronQ
pkgver=0.4.2
pkgrel=1
pkgdesc="An Fcron GUI"
arch=("any")
url="http://${_filename_}.Xavion.name"
license=("GPL3")
depends=("pyqt" "fcron")
optdepends=("gksu: A SU(do) GUI"
			"terminal: A shell GUI")
install="${_filename_}.install"
source=(http://prdownloads.sourceforge.net/${pkgname}/${_filename_}-${pkgver}.tar.bz2)

build() {
	cd "${srcdir}"/${_filename_}/Build

	# Fixes
	sed -i "s|slCmdArgs.append(\"'\" + Settings.Status.sScript + \"'\")|slCmdArgs.append(Settings.Status.sScript)|g" ../Source/Thread.py

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

sha1sums=('6157b70d484a95944c560f14638c07b88e01a2c3')
