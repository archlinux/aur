# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=key2root
pkgver=1.0.3
pkgrel=1
pkgdesc="Authenticate with keyfile and run a process as root"
arch=('x86_64')
url="https://codeberg.org/maandree/key2root"
license=('custom:ISC')
depends=('libar2simplified>=1.1.2' libar2 libblake libenv)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f1218e2ec94c073a3a8f925a2fc19689e69c9fb4516e5e270cc44758d0e9a33b)

build() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
