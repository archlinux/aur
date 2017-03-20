# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=piplib
pkgver=1.4.0
pkgrel=2
pkgdesc="Parametric Integer Programming Library"
arch=(x86_64)
url="http://www.piplib.org/"
license=('LGPL')
depends=("gmp")
provides=("piplib")
source=(http://www.bastoul.net/cloog/pages/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('f5d1c7d45c5c40c0d64fa7d6bb143740')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-gmp=system
  sed -i 's/ECHO/echo/' libtool
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
