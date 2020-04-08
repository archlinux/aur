# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=3.0.2
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('readline')
conflicts=('pspg-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

sha256sums=('e889259d4127b78c7b237a5e9d5144b9432937e448e3528b586580c5b346fe76')

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
