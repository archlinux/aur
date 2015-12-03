# Maintainer and Contributor: Vladimir Kamensky  <mastersoft24@yandex.ru>


pkgname=winregfs-git
pkgver=0.6.1
pkgrel=1
pkgdesc="Windows Registry FUSE filesystem "
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/winregfs"
license=('GPL')
categories=('utility')
#if [ "${CARCH}" = 'x86_64' ]; then
#    depends=('gcc-libs-multilib' 'lib32-curl' 'lib32-json-c' 'lib32-openssl' 'boost' 'lib32-libgcrypt' 'lib32-#expat' 'yajl')
#elif [ "${CARCH}" = 'i686' ]; then
#    depends=('gcc-libs' 'curl' 'json-c' 'openssl' 'boost-libs' 'libgcrypt' 'expat' 'yajl')
#fi

depends=()
#makedepends=('cmake' 'cppunit' 'boost')
makedepends=('make'  )
options=(!emptydirs)

source=("https://github.com/jbruchon/winregfs/archive/master.zip")

md5sums=("9782599b550fa7bd8047fe555ad0c7e4")


build() {
	cd "$srcdir/winregfs-master"
	
  
  

  rm -rf build
  mkdir build
#  cd build
#  cmake .. -DCMAKE_BUILD_TYPE=Release \
#    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS=-ljson-c

 make 
# make DESTDIR="$srcdir/winregfs-master/build" install
}
 
package() {
	cd "$srcdir/winregfs-master"
	
#	make DESTDIR="$srcdir/winregfs-master/build" install
	
	make DESTDIR="$pkgdir" install

#	#mkdir "${pkgdir}/usr/lib"
	#ln -s "/usr/lib/libboost_program_options.so" "${pkgdir}/usr/lib/libbost_program_options.so.1.56.0"
	#ln -s "/usr/lib/libboost_filesystem.so" "${pkgdir}/usr/lib/libboost_filesystem.so.1.56"

}
