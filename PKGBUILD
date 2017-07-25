# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=ctodo
pkgver=1.3
pkgrel=1
pkgdesc="A simple ncurses-based task manager."
url="http://ctodo.apakoh.dk"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ncurses' 'readline')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/nielssp/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('27f97d2ea65f0f48dd054b19ddcdbb6a')

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

