# Maintainer: 
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tim Yang <creslin@gmx.com>
# Contributor: Andrew Krawchyk <krawch_a@denison.edu>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Aurelien Foret <orelien@chez.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=beaver
pkgver=0.4.1
pkgrel=5
pkgdesc='Beaver is an Early AdVanced EditoR.'
arch=('x86_64')
url='http://beaver-editor.sourceforge.net/'
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme')
makedepends=('intltool')
source=(https://sourceforge.net/projects/beaver-editor/files/${pkgver:0:3}/beaver-${pkgver}.tar.bz2)
sha256sums=('844a327a59f2de21e48e55176d45207036837f08935c3341ea963dc62a1531e3')

build() {
  cd ${pkgname}-${pkgver}

#FS#70533
  CFLAGS="-fgnu89-inline -fcommon"  

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
