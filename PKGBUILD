#Maintainer: M. Mastroeni <the_maxtro@hotmail.it>
pkgname=gimp-gap
pkgver=2.6.0
pkgrel=3
pkgdesc="Gimp Animation Package, gimp's plugin for animation"
url="https://www.gimp.org/tutorials/Using_GAP/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gimp>=2.6.0' 'glib2')
optdepends=('xvidcore: compression codec' 
			'libbz2: data compressor' 
			'faac: audio encoder' 
			'faad2: audio decoder' 
			'lame: mpeg layer 3 codec' 
			'libx264: H264 codec')
source=("http://download.gimp.org/pub/gimp/plug-ins/v2.6/gap/${pkgname}-${pkgver}.tar.bz2")
md5sums=('249ed829de8b78675c0fe4ef4212089f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 ./configure CC="gcc" CXX="g++" LDFLAGS="-lm" CFLAGS="-g"
 cmake
 make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
