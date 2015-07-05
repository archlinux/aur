pkgname=open-phd-guiding2-svn
_svnname=open-phd-guiding
pkgver=684
pkgrel=1
pkgdesc="Version 2 of Open PHD Guiding, autoguiding for telescopes"
url="http://code.google.com/p/open-phd-guiding/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk' 'v4l-utils' 'zlib' 'cfitsio' 'opencv')
#optdepends=('')
makedepends=('subversion')
source=("${_svnname}::svn+http://open-phd-guiding.googlecode.com/svn/trunk/")
sha1sums=('SKIP')

pkgver() {
	cd "$SRCDEST/${_svnname}"
	svnversion | tr -d [A-z]
}

build() {
	cd $_svnname
	make
}

package() {
	cd $_svnname
	make DESTDIR="${pkgdir}" install
}

