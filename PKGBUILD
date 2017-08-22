## Maintainer: realasking
pkgname=blogilo-kde4
pkgver=1.0.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'boost-libs' 'kdelibs' 'kdelibs4support' 'kdepimlibs4')
pkgdesc='Blogilo is a blog client in KDE platform, this is a legacy version for those who can not input in visual editor in the KDE5 version. It is an older version comes from KDE4.5 and there might be some bugs.'
url='https://github.com/KDE/kdepim/tree/KDE/4.5'
conflicts=('blogilo')
provides=('blogilo')
source=(
	'https://github.com/KDE/kdepim/archive/KDE/4.5.zip'
)
md5sums=('12711f557c0929f00ce2a5be00d08973')

_blogdir="kdepim-KDE-4.5/blogilo"

build() {
  mkdir -p "${srcdir}/${_blogdir}/build"
  cd "${srcdir}/${_blogdir}/build" 
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. 
  make 
}

package() {
   cd "${srcdir}/${_blogdir}/build"
   make DESTDIR="${pkgdir}" install 
}

