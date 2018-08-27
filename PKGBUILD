# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe
pkgver=1.43
pkgrel=3
pkgdesc='X File Explorer (Xfe) is an MS-Explorer like file manager for X'
arch=('x86_64')
url='http://roland65.free.fr/xfe'
license=('GPL')
depends=('fox>=1:1.6' 'fox<1:1.7' 'freetype2' 'xcb-util')
makedepends=('intltool' 'libxft')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6bd17b7aa6ac56c6c70238ad8aa5af9606cd2dfe34b35b44fc8041e4c1ba60a0')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh 
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
