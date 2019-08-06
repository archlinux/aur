# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=3.1.1
pkgrel=1
pkgdesc="Indents and beautifies Fortran source"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/findent/"
license=('custom:BSD')
depends=('bash')
source=("https://datapacket.dl.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b22ab3e0675abce73fef50c4805189e60ad84f5df0f64c2db2ff929ac8e83419')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENCE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE
}
