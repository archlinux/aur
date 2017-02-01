# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Jan de Groot <jgc [at] archlinux [dot] org>
# Contributor: Kritoke <typeolinux [at] yahoo [dot] com>

pkgname=libgnomecanvasmm
pkgver=2.26.0
pkgrel=4
pkgdesc="A C++ wrapper for libgnomecanvas."
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtkmm' 'libgnomecanvas')
makedepends=('pkgconfig')
url="http://www.gtkmm.org/"
source=("https://download.gnome.org/sources/${pkgname}/2.26/${pkgname}-${pkgver}.tar.bz2")
md5sums=('a148c99311d46397de6e4a31736771ab')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
