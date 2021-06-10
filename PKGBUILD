# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=5.0.3
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('ncurses' 'readline' 'postgresql-libs')
conflicts=('pspg-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

sha256sums=('1480950baa121ad8fd5907a551d0b31c8d2c2d3a3a36d4a47a5b62106e7ba088')

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
