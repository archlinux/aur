# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe
pkgver=1.43.2
pkgrel=1
pkgdesc='X File Explorer (Xfe) is an MS-Explorer like file manager for X'
arch=('x86_64')
url='http://roland65.free.fr/xfe'
license=('GPL')
depends=('fox>=1:1.6' 'fox<1:1.7' 'freetype2' 'xcb-util')
makedepends=('intltool' 'libxft')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fa5f38fcac64b91eb5d615620a9607b7e6f8675c4f19f30473798b2acb0c85ba')

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
