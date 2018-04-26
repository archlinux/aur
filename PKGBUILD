# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=1.1.0
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('readline')
conflicts=('pspg-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5fe4bd0b72ee73fad41e64cafb398806784010e461e6e773334b3b750f7f2df5')

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
