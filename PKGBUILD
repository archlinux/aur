# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=tenace
pkgver=0.17
pkgrel=1
pkgdesc="A Bridge hand viewer and editor with double dummy solver"
arch=('i686' 'x86_64')
url="http://www.df7cb.de/bridge/tenace/"
license=('GPL')
depends=('gtk2')
source=("http://www.df7cb.de/bridge/tenace/source/${pkgname}-${pkgver}.tar.gz")
md5sums=('d6dae022574d90479e5e3c389742dfa7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr LDFLAGS=-lm
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
