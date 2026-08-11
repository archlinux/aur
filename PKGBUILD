# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe
pkgver=2.1.11
pkgrel=1
pkgdesc='X File Explorer (Xfe) is an MS-Explorer like file manager for X'
arch=('x86_64')
url='http://roland65.free.fr/xfe'
license=('GPL-2.0-or-later')
depends=('fox' 'freetype2' 'xcb-util' 'libxft')
makedepends=('intltool')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ea8a12a7b03bc0e08765967f9fd8e2a6bd0c5eb90092f7f020c7f9c76456a8ed')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
