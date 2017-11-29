# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sbxkb
pkgver=0.7.6
pkgrel=2
pkgdesc="Simple tray XKB indicator"
arch=('x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
depends=('gtk2')
makedepends=('pkgconfig')
source=(https://downloads.sourceforge.net/project/staybox/${pkgname}-${pkgver}.tar.gz)
sha256sums=('55f8844f9c82ed063d26ee34622ec698db3e9338175865e49e34b1e254f4d4f5')

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
