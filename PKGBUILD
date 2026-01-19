# Maintainer: Edscott <edscott.wilson.garcia@gmail.com>

pkgname="xffm"
pkgver="4_20_3"
pkgrel=3
license=('GPL3')
pkgdesc="Advanced filemanager for i3 window manager."
arch=('i686' 'x86_64')
url="http://xffm.sourceforge.net/"
source=("https://sourceforge.net/projects/xffm/files/xffm%2B/$pkgname$pkgver-$pkgrel.bz2")
makedepends=('cmake' 'pkgconfig' 'libzip' 'readline' 'librsvg' 'libmagick' 'gtk4')
depends=('ecryptfs-utils' 'sudo'  'ghostscript')
md5sums=('de81aae3ecc57e0fbd5bb877e5245072')

build() {
	cd "xffm4/build"
  cmake ..
	make
}

package() {
	cd "xffm4/build"
  make install DESTDIR="${pkgdir}"
  ln -sf "${pkgdir}/usr/local/bin/xffm4" "${pkgdir}/usr/local/bin/xfgetpass4"
}

