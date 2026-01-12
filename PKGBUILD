# Contributer: machoo02 <ichthyoboy at gmail dot com>

pkgname=clustalw
pkgver=2.1
pkgrel=5
pkgdesc="Clustal W multiple sequence alignment program, version 2.0"
arch=('i686' 'x86_64')
provides=('clustalw2')
url="https://ftp.ebi.ac.uk/pub/software/clustalw2/"
license=('LGPL3')
depends=('glibc' 'gcc-libs')
source=(${url}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
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


