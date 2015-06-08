# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=j7z
_filename_=J7Z
pkgver=1.3.0
pkgrel=1
pkgdesc="An alternative 7-Zip GUI"
arch=("any")
url="http://${_filename_}.Xavion.name"
license=("LGPL3")
depends=("java-runtime>=7" "p7zip")
#makedepends=("apache-ant" "java-environment>=7")
optdepends=("gtk-kde4: KDE style support"
			"oxygen-gtk: Native 'Oxygen' style"
			"tar: Supports POSIX attributes"
			"gzip: Supports GZip archives"
			"bzip2: Supports BZip2 archives"
			"xz: Supports XZ archives")
conflicts=("q7z" "k7z")
replaces=("q7z" "k7z")
install="${_filename_}.install"
#source=(http://prdownloads.sourceforge.net/k7z/${_filename_}-${pkgver}-src.tar.bz2)
source=(http://prdownloads.sourceforge.net/k7z/${_filename_}-${pkgver}-bin.tar.bz2)

build() {
	cd "${srcdir}"/${_filename_}/Linux/Build

	# Environment
	source /etc/profile.d/jre.sh || source /etc/profile.d/jdk.sh
	#source /etc/profile.d/apache-ant.sh

	#make uninstall
	#make clean
	make
}

package() {
	cd "${srcdir}"/${_filename_}/Linux/Build

	make Packaging=1 DESTDIR="${pkgdir}" install

	# Messages
	msg "Seek further information or send feedback via the 'Help' menu."
}

#sha1sums=('7d7fc964de1e6323c6323b960eb3425859ae744a')
sha1sums=('830623317ffdae88c82a1eefc6f0b760113a8c7d')
