#Maintainer: M. Mastroeni <the_maxtro@hotmail.it>
pkgname=gimp-gap
pkgver=2.6.1
pkgrel=2
pkgdesc="Gimp Animation Package, gimp's plugin for animation"
url="https://www.gimp.org/tutorials/Using_GAP/"
arch=('x86_64' 'i686')
license=('GPLv3' )
depends=('gimp>=2.6.0' 'glib2')
makedepends=( 'intltool')
optdepends=('xvidcore: compression codec' 
			'lbzip2: data compressor' 
			'faac: audio encoder' 
			'faad2: audio decoder' 
			'lame: mpeg layer 3 codec' 
			'libx264: H264 codec')
source=('git+https://github.com/GNOME/gimp-gap')
md5sums=('SKIP')

package() {
  cd "${srcdir}/gimp-gap"
 ./autogen.sh CC="gcc" CXX="g++" LDFLAGS="-lm" CFLAGS="-g"
 cmake
 make
 make DESTDIR="${pkgdir}" install
}
