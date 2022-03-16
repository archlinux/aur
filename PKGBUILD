# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=csol
pkgver=1.5.0
pkgrel=1
pkgdesc="A small collection of ncurses-based solitaire/patience games."
url="https://github.com/nielssp/csol"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ncurses')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/nielssp/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('84cbcbee07c37824f0b602eb09e2afa1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGES.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

