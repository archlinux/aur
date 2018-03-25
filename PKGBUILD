# Maintainer: Muflone http://www.muflone.com/#contacts
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gdl2
pkgver=2.30.1
pkgrel=2
pkgdesc="GNOME Devtool Libraries (GTK+ 2.x)"
arch=('x86_64')
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk2>=2.22.0')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/gdl/${pkgver%.*}/gdl-${pkgver}.tar.bz2")
sha256sums=('027dd1cd0191996fe1a0dc902da857698cc79564cb057ba13b09097e56e30cc1')

build() {
  cd "gdl-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "gdl-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
