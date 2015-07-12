# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=szip
pkgver=2.1
pkgrel=3
pkgdesc="High compression library"
url="http://www.hdfgroup.org/doc_resource/SZIP"
license=('custom')
arch=('i686' 'x86_64')
source=("http://www.hdfgroup.org/ftp/lib-external/szip/${pkgver}/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a816d95d5662e8279625abdbea7d0e62157d7d1f028020b1075500bf483ed5ef')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -m644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
