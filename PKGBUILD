# Maintainer: Sebastian Wilzbach < sebi at wilzbach dot me >
# Contributor: Kai Hildebrandt (derhil) <kai@derhil.de>
# Contributor: Aline Freitas <aline@alinefreitas.com.br>

pkgname=pidgin-hide-chat
pkgver=1.0
pkgrel=2
pkgdesc="Pidgin plugin to show/hide chat windows on connect."
arch=('any')
url="http://launchpad.net/pidgin-hide-chat/"
license=('GPL')
depends=('pidgin' 'glibc' 'intltool')
makedepends=('pkgconfig')
md5sums=('6d37ac9617bc383952ce80a773460dde')

source=("http://launchpad.net/pidgin-hide-chat/trunk/1.0/+download/pidgin-hide-chat-$pkgver.tar.gz") 

build() {
  cd  "$srcdir"/$pkgname-$pkgver
  ./configure  --prefix=/usr
  make
}

package(){
  cd  "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
