# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Jan de Groot <jgc [at] archlinux [dot] org>
# Contributor: Kritoke <typeolinux [at] yahoo [dot] com>

pkgname=libgnomecanvasmm
pkgver=2.8.0
pkgrel=1
pkgdesc="A C++ wrapper for libgnomecanvas."
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtkmm' 'libgnomecanvas')
makedepends=('pkgconfig')
url="http://www.gtkmm.org/"
source=("https://download.gnome.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('f5a4862670a74f038a73f8231c2f4aeec3627a81f584e1210b07431c8d1d9e95060e887235cb840367c44b127455032141c52a35ebe64f69d0d2188ec9d87c7b')

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
