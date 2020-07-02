# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ignuit
pkgver=2.24.3
pkgrel=1
pkgdesc='A memorization aid based on the Leitner flashcard system'
arch=('x86_64')
url='https://savannah.gnu.org/projects/ignuit'
license=('GPL3')
depends=('libgnomeui'
         'gstreamer'
         'libgnomeui'
         'libxslt')
makedepends=('perl-xml-parser'
             'gnome-doc-utils'
             'libgnomeui'
             'libglade'
             'libxslt'
             'gconf'
             'gstreamer'
             'intltool')
source=("${pkgname}-${pkgver}.tar.xz::http://ftp.gnu.org/gnu/ignuit/ignuit-${pkgver}.tar.gz")
sha256sums=('0333024c74ba04903701500e342cadf5efba85ebfb738222a3364c592bba33c7')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
# vim:set ts=2 sw=2 et: