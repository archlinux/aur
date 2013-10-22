# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributer: Ben <ben@benmazer.net>

pkgname=gtkspell
pkgver=2.0.16
pkgrel=3
url="http://gtkspell.sourceforge.net/"
pkgdesc="Provides word-processor-style highlighting and replacement of misspelled words in a GtkTextView widget"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'enchant')
makedepends=('intltool' 'gtk-doc')
options=('!libtool')
source=(http://gtkspell.sourceforge.net/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('f75dcc9338f182c571b321d37c606a94')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
