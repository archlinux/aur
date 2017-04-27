# Maintainer: Tobias Bohrmann (PlainTextField) <honeypot.carbage@aechelon.de>

pkgname=gtef
provides=('gtef')
pkgver=2.0.1
pkgrel=1
pkgdesc="A library that eases the development of GtkSourceView-based text editors and IDEs"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/Gtef"
license=('LGPL2.1')
depends=('gtk3' 'gtksourceview3' 'glib2' 'libxml2' 'uchardet')
source=("https://download.gnome.org/sources/gtef/${pkgver%.*}/gtef-${pkgver}.tar.xz")
sha256sums=('8432f0f404b93e5a2702978b5f121b8f9ae2167c906e9f2ed7b5165142e27a4f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}
package(){
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}/" install
}
