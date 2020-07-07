# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sbxkb
pkgver=0.7.6
pkgrel=4
pkgdesc="Simple tray XKB indicator"
arch=('x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
depends=('gtk2')
makedepends=('pkgconfig')
source=(https://downloads.sourceforge.net/project/staybox/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d43cff3014f566e47080ea828910f2ab856d28dce5cc7a526726a4f1666cc9fca8dcc7616b40d91e405e1db3b8d6373bbb97d96e6e36f496d9047f37328b04dc')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  export LDFLAGS=-lX11
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
