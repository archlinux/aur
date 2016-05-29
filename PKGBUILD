# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=upplay
pkgname=${_gitname}-git
pkgver=UPPLAY_0.8.5.r296.gbcca0f0
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp>=0.14.1' 'qtwebkit')
makedepends=('qtchooser')
source=("git+https://github.com/medoc92/upplay.git")
md5sums=('SKIP')
         
pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "${srcdir}/${_gitname}"
	qmake-qt4 PREFIX="/usr"
}

package(){
	cd "${srcdir}/${_gitname}"
	make install INSTALL_ROOT="${pkgdir}"
}
