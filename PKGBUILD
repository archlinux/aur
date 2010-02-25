# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmm
pkgver=2.19.6
pkgrel=1
pkgdesc="C++ bindings for gtk2"
arch=('i686' 'x86_64')
depends=('gtk2>=2.19.6' 'pangomm>=2.26.0' 'glibmm>=2.22.1')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.19/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('5d51071c0cb597778d3aa66245eace32449a0720ab7fae8b2cc5d59282389a7f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
