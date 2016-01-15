# Maintainer: Simon Arjuna Erat (sea), erat.simon@gmail.com
# Contributor: Simon Arjuna Erat (sea), erat.simon@gmail.com

#
#	Variables
#
	# Prj info
	_hkgname=tui-master
	pkgname=tui
	pkgdesc="Text User Interface, framework for scripts"
	license=('GPL3')
	groups=()
	
	# Pkg info
	arch=('any')
	pkgver=0.9.4
	pkgrel=3
	
	# Src info -- As the master branch is used for releases, this is considered 'stable'.
	url="https://savannah.nongnu.org/projects/tui/"
	source=(http://git.savannah.gnu.org/cgit/${pkgname}.git/snapshot/${pkgname}-master.tar.gz)
md5sums=('225965c4d04419de6351bae30bc0fd39')
	
	# Bld info
	provides=('tui')
	depends=('bash' 'gawk' 'gettext' 'coreutils')
	makedepends=('texinfo' 'txt2man')
#
#	Functions
#
	package() {
		cd ${srcdir}/${_hkgname}
		./configure --prefix=/usr --chroot=$pkgdir
		./make-install-all
	}
