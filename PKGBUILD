# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=libxaw3dxft 
_pkgname=libXaw3dXft 
pkgver=1.6.2c
pkgrel=2
epoch=1
pkgdesc="xaw3d library for xpaint"
url="http://sourceforge.net/projects/sf-xpaint/files/libxaw3dxft/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft' 'libxmu' 'libxpm')
makedepends=('xorg-util-macros')
conflicts=('xaw3d')
provides=('xaw3d')
source=("http://sourceforge.net/projects/sf-xpaint/files/$pkgname/${_pkgname}-$pkgver.tar.bz2")
md5sums=('eaf7638fad4016abad4a3116485c8e67')

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
