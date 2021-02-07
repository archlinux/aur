# Maintainer: Muflone http://www.muflone.com/#contacts
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gdl2
pkgver=2.31.2
pkgrel=1
pkgdesc="GNOME Devtool Libraries (GTK+ 2.x)"
arch=('x86_64')
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk2>=2.22.0')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/gdl/${pkgver%.*}/gdl-${pkgver}.tar.bz2")
sha256sums=('44b7b14acb2a0193f4431dfe4c2bb096f43edaf06b4387bd818d802a9ccfd61b')

build() {
  cd "gdl-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "gdl-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
