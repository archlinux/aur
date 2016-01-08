# Maintainer: Niels Poulsen <apakoh@apakoh.dk>
pkgname=ctodo
pkgver=1.2
pkgrel=1
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
source=("https://github.com/nielssp/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('475f62b95bb025d3a954fcebdd986f65')

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

