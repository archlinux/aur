# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe
pkgver=1.45
pkgrel=1
pkgdesc='X File Explorer (Xfe) is an MS-Explorer like file manager for X'
arch=('x86_64')
url='http://roland65.free.fr/xfe'
license=('GPL')
depends=('fox>=1:1.6' 'fox<1:1.7' 'freetype2' 'xcb-util' 'libxft')
makedepends=('intltool')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('466bd5533a82b114705e00b861a6ede3ab851e72f45c55a77107d70c6fa8c037')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
