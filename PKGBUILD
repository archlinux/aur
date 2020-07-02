# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ignuit
pkgver=0.0.14
pkgrel=1
pkgdesc='A memorization aid based on the Leitner flashcard system'
arch=('x86_64')
url='https://savannah.gnu.org/projects/ignuit'
license=('GPL3')
depends=('libgnomeui'
         'gstreamer0.10'
         'libgnomeui'
         'libxslt')
makedepends=('perl-xml-parser'
             'gnome-doc-utils'
             'libgnomeui'
             'libglade'
             'libxslt'
             'gconf'
             'gstreamer0.10')
source=("${pkgname}-${pkgver}.tar.xz::http://ftp.gnu.org/gnu/ignuit/ignuit-${pkgver}.tar.gz")
sha256sums=('e2c817d27dc8c7a52cdc42a76d87ce81de28e5edf22c2278a78a7e3853e72dac')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
  rm -rf "${pkgdir}/usr/share/locale"
}
# vim:set ts=2 sw=2 et: