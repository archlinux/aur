# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmm
pkgver=2.18.2
pkgrel=1
pkgdesc="C++ bindings for gtk2"
arch=(i686 x86_64)
depends=('gtk2>=2.18.1' 'pangomm>=2.26.0' 'glibmm>=2.22.1')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.18/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('dfc003e22ecdc046cbae731b24e077ed87efa0f9ca57a0735dfe716c560b474e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
