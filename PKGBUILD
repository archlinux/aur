# Maintainer: Geoffrey Teale <geoffrey@teale.de>
_name=websocket
pkgname=guile-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc="A guile implementation of the WebSocket protocol as defined by RFC 6455."
arch=(any)
url="https://dthompson.us/projects/guile-websocket.html"
license=('LGPL-3.0-or-later')
groups=()
depends=("guile>=3.0")
makedepends=("guile>=3.0")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.dthompson.us/releases/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('9b7f45fd0f4fb4722599d0bcf041bcbc')

build() {
  cd "$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
