# Maintainer: Bernd Prünster <aur@berndpruenster.org>
pkgname=gspell
pkgver=0.1.0
pkgrel=1
pkgdesc=" a flexible API to implement the spell checking in a GTK+ application"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/gspell"
license=('GPL2')
depends=('gtk3' 'gtksourceview3' 'enchant' 'libxml2')
makedepends=('intltool' 'itstool')
source=("https://download.gnome.org/sources/gspell/${pkgver%.*}/gspell-${pkgver}.tar.xz")
sha256sums=('8c10c5c447ca8c4a230516bd89bcfb00791fe3b4a7bbd4f34a53c72505db9628')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # currently not needed, but might be again in the future
  # export ac_cv_path_VALAC=""
  ./configure  --prefix=/usr
  make  || return 1
}
package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
