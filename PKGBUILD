# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=libxaw3dxft 
_pkgname=libXaw3dXft 
pkgver=1.6.2g
pkgrel=1
epoch=1
pkgdesc="xaw3d library for xpaint"
url="http://sourceforge.net/projects/sf-xpaint/files/libxaw3dxft/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft' 'libxmu' 'libxpm')
makedepends=('xorg-util-macros')
source=("http://sourceforge.net/projects/sf-xpaint/files/$pkgname/${_pkgname}-$pkgver.tar.bz2")
sha256sums=('5e49ba018d5fac7faf5b78844eed11f52c73c5e0651630620abad8feec8aad00')

build() {
  cd ${_pkgname}-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --enable-internationalization \
    --enable-multiplane-bitmaps \
    --enable-gray-stipples \
    --enable-arrow-scrollbars
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR=$pkgdir install
}
