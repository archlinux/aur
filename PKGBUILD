# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=geeqie-lirc
pkgver=1.3
pkgrel=1
pkgdesc="A lightweight image browser and viewer with remote support (LIRC)"
_cpkgname="geeqie-1.3"
arch=('i686' 'x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('exiv2' 'gtk2' 'lcms' 'lirc' 'desktop-file-utils')
makedepends=('intltool' 'doxygen' 'gnome-doc-utils' 'git')
optdepends=('librsvg: SVG rendering'
	    'fbida: for jpeg rotation'
	    'exiv2: for tiff and png rotation')
conflicts=('geeqie' 'geeqie-git')
provides=('geeqie')
source=(http://www.geeqie.org/${_cpkgname}.tar.xz)
sha1sums=('f991b44d8587f2f42d5793700c5f6882bed6abf9')

build() {
  cd "${srcdir}/${_cpkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-lirc
  make
}

package(){
  cd "${srcdir}/${_cpkgname}"
  make DESTDIR="${pkgdir}" install
}
