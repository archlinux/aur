# Maintainer: willemw <willemw12@gmail.com>

pkgname=fapg
pkgver=0.44
pkgrel=1
pkgdesc="Fast Audio Playlist Generator"
arch=('x86_64')
url="http://royale.zerezo.com/fapg/"
license=('GPL2')
depends=('uriparser')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('41b9b08978889474791ea2418d39378d5cd44e101d4b7e6cc7cbbce9470c812f')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

