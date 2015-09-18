# Contributer: machoo02 <ichthyoboy at gmail dot com>

pkgname=clustalw
pkgver=2.1
pkgrel=3
pkgdesc="Clustal W multiple sequence alignment program, version 2.0"
arch=('i686' 'x86_64')
provides=('clustalw2')
url="http://www.clustal.org"
license=('GPL3')
depends=('glibc' 'gcc-libs')
source=(${url}/download/current/${pkgname}-${pkgver}.tar.gz)
md5sums=('144df8440a0ae083d5167616c8ceeb41')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


