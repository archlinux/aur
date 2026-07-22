# Maintainer: Edscott <edscott.wilson.garcia@gmail.com>

pkgname="xffm"
pkgver="4_22_4"
pkgrel=1
license=('GPL3')
pkgdesc="Advanced filemanager for i3 window manager."
arch=('i686' 'x86_64' 'arm64')
url="http://xffm.sourceforge.net/"
source=("https://sourceforge.net/projects/xffm/files/xffm%2B/$pkgname$pkgver-$pkgrel.bz2")
makedepends=('cmake' 'pkgconfig' 'libzip' 'readline' 'librsvg' 'libmagick' 'gtk4')
depends=('ecryptfs-utils' 'sudo')
md5sums=('d6a22d7e2a43ce6bfd8743d62d7f2183')

build() {
	cd "$pkgname$pkgver-$pkgrel/build"
  cmake ..
	make
}

package() {
	cd "$pkgname$pkgver-$pkgrel/build"
  make install DESTDIR="${pkgdir}"
  ln -sf "${pkgdir}/usr/local/bin/xffm4" "${pkgdir}/usr/local/bin/xfgetpass4"
}

