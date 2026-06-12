# Maintainer: Geoffrey Teale <geoffrey@teale.de>
_name=websocket
pkgname=guile-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc="A guile implementation of the WebSocket protocol as defined by RFC 6455."
arch=(any)
url="https://dthompson.us/projects/guile-websocket.html"
license=('LGPL-3.0-or-later')
depends=("guile>=3.0", "guile-gnutls")
makedepends=("guile>=3.0")
source=(https://files.dthompson.us/releases/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('1ba6c0d1d175f4a68b58ce003257477e3931fea0d70593881aa7177cb99483fc')

build() {
  cd "$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
