# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Andrew Fuller <qartis@gmail.com>

pkgname=delay
pkgver=1.6
pkgrel=2
pkgdesc="Execute a command after a specified period of time or until a time has reached"
arch=('i686' 'x86_64')
url="http://onegeek.org/~tom/software/delay/"
license=("GPL")
source=("http://onegeek.org/~tom/software/${pkgname}/dl/${pkgname}-${pkgver}.tar.gz"
        "add-stdlib_h.patch")
sha256sums=('3097a25fc0d0091402fc9dbc6aa395fd5141028bcdc99baa5d3438ca04f78ca2'
            'a3dc18a07618361e7cdeeea9e15bb50ea70fe1d97ea3402928a1d4ceef712b0b')

prepare() {
  patch -p0 -i "add-stdlib_h.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
