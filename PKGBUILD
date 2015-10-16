# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=libxaw3dxft 
_pkgname=libXaw3dXft 
pkgver=1.6.2d
pkgrel=1
epoch=1
pkgdesc="xaw3d library for xpaint"
url="http://sourceforge.net/projects/sf-xpaint/files/libxaw3dxft/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft' 'libxmu' 'libxpm')
makedepends=('xorg-util-macros')
source=("http://sourceforge.net/projects/sf-xpaint/files/$pkgname/${_pkgname}-$pkgver.tar.bz2")
md5sums=('afef22ae4a23a1c9cd0ddc5c8df48315')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --enable-internationalization \
    --enable-multiplane-bitmaps \
    --enable-gray-stipples \
    --enable-arrow-scrollbars
  make
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  make DESTDIR=$pkgdir install
}
