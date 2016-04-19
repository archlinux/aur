# Maintainer: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
# Based on the J7Z AUR package by Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=j7z-svn
_filename_=J7Z
_revision_=145
pkgver=r${_revision_}
pkgrel=1
pkgdesc="An alternative 7-Zip GUI"
arch=("any")
url="https://sourceforge.net/projects/k7z/"
license=("LGPL3")
depends=("java-runtime>=7" "p7zip")
makedepends=("apache-ant" "java-environment>=7")
optdepends=("gtk-kde4: KDE style support"
			"oxygen-gtk: Native 'Oxygen' style"
			"tar: Supports POSIX attributes"
			"gzip: Supports GZip archives"
			"bzip2: Supports BZip2 archives"
			"xz: Supports XZ archives")
conflicts=("j7z" "q7z" "k7z")
install="${_filename_}.install"
source=(https://sourceforge.net/code-snapshots/svn/k/k7/k7z/code/k7z-code-${_revision_}-trunk.zip)

build() {
	cd "${srcdir}"/k7z-code-${_revision_}-trunk/${_filename_}/Linux/Build

	# Environment
	source /etc/profile.d/jre.sh || source /etc/profile.d/jdk.sh
	#source /etc/profile.d/apache-ant.sh

	#make uninstall
	#make clean
	make
}

package() {
	cd "${srcdir}"/k7z-code-${_revision_}-trunk/${_filename_}/Linux/Build

	make Packaging=1 DESTDIR="${pkgdir}" install

	# Messages
	msg "Seek further information or send feedback via the 'Help' menu."
}

sha1sums=('SKIP')
