# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributer: Ben <ben@benmazer.net>

pkgname=gtkspell
pkgver=2.0.15
pkgrel=1
url="http://gtkspell.sourceforge.net/"
pkgdesc="GtkSpell provides word-processor-style highlighting and replacement of misspelled words in a GtkTextView widget"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2>=2.14.6' 'enchant>=1.4.2')
makedepends=('intltool')
options=('!libtool')
source=(http://gtkspell.sourceforge.net/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('d90a7fe883f29caca149f04f31e2f0f9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
