# Maintainer: Uffe Jakobsen < uffe@uffe.org >
# Contributor: Calle Erlandsson <calle@calleerlandsson.com>

pkgname=pick
pkgver=2.0.2
pkgrel=1
pkgdesc='A fuzzy search tool for the command line'
arch=('i686' 'x86_64')
url='https://github.com/calleerlandsson/pick'
license=('MIT')
depends=('ncurses')
source=("https://github.com/calleerlandsson/pick/releases/download/v${pkgver}/pick-${pkgver}.tar.gz")
sha256sums=('f2b43aaa540ad3ff05a256a531c2f47d3d95145b82c1d1b0d62dfb40d793d385')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
