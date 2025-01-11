# Maintainer: willemw <willemw12@gmail.com>

pkgname=fapg
pkgver=0.45
pkgrel=1
pkgdesc='Fast Audio Playlist Generator'
arch=(x86_64)
url=http://royale.zerezo.com/fapg
license=(GPL2)
depends=(uriparser)
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('e86f9f6f1f9fb0b8b67578b52364e35f84390b3e50f17ab983cf35431b41cb59')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
