# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=j7z
_filename_=J7Z
pkgver=1.4.2
pkgrel=1
pkgdesc="An alternative 7-Zip GUI"
url="https://${_filename_}.Xavion.name"
arch=("any")
license=("LGPL3")
depends=("java-runtime>=8" "p7zip")
#makedepends=("apache-ant" "java-environment>=8")
optdepends=("oxygen-gtk2: Native 'Oxygen' style"
		"gtk-kde4: KDE 4 style support"
		"tar: Supports POSIX attributes"
		"gzip: Supports GZip archives"
		"bzip2: Supports BZip2 archives"
		"xz: Supports XZ archives")
conflicts=("q7z" "k7z")
replaces=("q7z" "k7z")
install="${_filename_}.install"
#source=(https://prdownloads.sourceforge.net/k7z/${_filename_}-${pkgver}-src.tar.bz2)
source=(https://prdownloads.sourceforge.net/k7z/${_filename_}-${pkgver}-bin.tar.bz2)

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

sha1sums=('e8380fd38f449da3dea5da1643475ae300bc3d22')
