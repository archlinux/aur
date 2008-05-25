# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributer: Ben <ben@benmazer.net>

pkgname=gtkspell
pkgver=2.0.13
pkgrel=1
url="http://gtkspell.sourceforge.net/"
pkgdesc="GtkSpell provides word-processor-style highlighting and replacement of misspelled words in a GtkTextView widget"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'enchant')
options=('!libtool')
source=(http://gtkspell.sourceforge.net/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('f4e21418d2e53bcf4c7affcdae8a213e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-gtk-doc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
