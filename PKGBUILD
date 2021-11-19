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
source=("https://download.gnome.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('23795c856674b79f82d2e5cffdfdbf67a387fe6a21081fef1d96d0f614a121710c7f1e175612a286f5946a60cea4e8506aef7833a7bdf73084d6266c09aad66b')

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
