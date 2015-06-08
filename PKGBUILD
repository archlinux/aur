# Maintainer: Niels Poulsen <apakoh@apakoh.dk>
pkgname=ctodo
pkgver=1.1
pkgrel=3
pkgdesc="A simple ncurses-based task manager."
url="http://ctodo.apakoh.dk"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ncurses')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/downloads/Acolarh/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1896cdce31984d82f985ca7a4036cd12')

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

