# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=1.6.5
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('readline')
conflicts=('pspg-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7a997af15b5a392b5112f826d88e808661986e1ef95bc344071dc8bd5e4f9204')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
