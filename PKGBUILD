# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=csol
pkgver=1.3.0
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
md5sums=('5ce30c3e839b3b61ec4199feb44d11b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

