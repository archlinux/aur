# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=key2root
pkgver=1.0
pkgrel=2
pkgdesc="Authenticate with keyfile and run a process as root"
arch=('x86_64')
url="https://maandree.se/proj/key2root.html"
license=('custom:ISC')
depends=('libar2simplified>=1.1.2' libar2 libblake)
source=($pkgname-$pkgver.tar.gz::https://git.maandree.se/$pkgname/snapshot/$pkgname-$pkgver.tar.gz)
sha256sums=(c365a009daf784398a0d93b0875a263a078cbc8f417c9e262bd83bab57b0a19e)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
