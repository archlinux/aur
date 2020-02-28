# Maintainer: lemust83 <lemust83420@gmail.com>
# Contributor: Pierre-Olivier Vauboin <povauboin@gmail.com>

pkgname=cardpeek
pkgver=0.8.4
pkgrel=2
pkgdesc="A tool to read-only the contents of smartcards"
arch=('armv7h' 'i686' 'x86_64')
url="http://pannetrat.com/Cardpeek"
license=('GPL3')
depends=('gtk3' 'lua52' 'pcsclite' 'curl')

source=("http://downloads.pannetrat.com/install/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9c78dfdf84493c551b49447e4bb46c8d7b33f0785b93893222b70b6115013a85')

build() {
  cd ${pkgname}-${pkgver}
  ./configure LUA_CFLAGS="-I/usr/include/lua5.2" LUA_LIBS="-llua5.2 -lm" --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}

