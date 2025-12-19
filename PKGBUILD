# Maintainer: Edscott <edscott.wilson.garcia@gmail.com>

pkgname="xffm"
pkgver="4_20_3"
pkgrel=1
license=('GPL3')
pkgdesc="Advanced filemanager for i3 window manager."
arch=('i686' 'x86_64')
url="http://xffm.sourceforge.net/"
source=("https://sourceforge.net/projects/xffm/files/xffm%2B/$pkgname$pkgver.bz2")
makedepends=('cmake' 'pkgconfig' 'libzip' 'readline' 'librsvg' 'libmagick' 'gtk4')
depends=('ecryptfs-utils' 'sudo')
md5sums=('d48617be3f927b9bde77ec8d7e436f1c')

build() {
	cd "$pkgname$pkgver/build"
  cmake ..
	make
}

package() {
	cd "$pkgname$pkgver/build"
  make install DESTDIR="${pkgdir}"
  ln -sf "${pkgdir}/usr/local/bin/xffm4" "${pkgdir}/usr/local/bin/xfgetpass4"
}

