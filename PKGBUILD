# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=4.1.0
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('ncurses' 'readline' 'postgresql-libs')
conflicts=('pspg-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

sha256sums=('07ff8555a5fa65da61597d285cae99915b76b888f91026a0cc89340c1666e8c7')

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
