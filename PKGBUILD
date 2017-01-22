# $Id: PKGBUILD 150066 2015-12-07 17:04:39Z fyan $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.orgg>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=libgtksourceviewmm2
pkgver=2.10.3
pkgrel=2
pkgdesc='A C++ API for gtksourceview2'
arch=('i686' 'x86_64')
url='http://projects.gnome.org/gtksourceviewmm/'
license=('LGPL')
depends=('gtkmm' 'gtksourceview2')
makedepends=('doxygen' 'glibmm-docs')
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/gtksourceviewmm/2.10/gtksourceviewmm-$pkgver.tar.xz)
sha256sums=('0000df1b582d7be2e412020c5d748f21c0e6e5074c6b2ca8529985e70479375b')

build() {
  cd gtksourceviewmm-${pkgver}

  CXXFLAGS+=' -std=c++11'
  ./configure \
    --prefix=/usr

  make
}

package() {
  cd gtksourceviewmm-${pkgver}

  make DESTDIR=${pkgdir} install
}
