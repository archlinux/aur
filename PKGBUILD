# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=key2root
pkgver=1.0.2
pkgrel=1
pkgdesc="Authenticate with keyfile and run a process as root"
arch=('x86_64')
url="https://codeberg.org/maandree/key2root"
license=('custom:ISC')
depends=('libar2simplified>=1.1.2' libar2 libblake libenv)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(d7d30b4e5128a41703664e83817f5e34c5784ccc0a9be80f2f287082ff3e435f)

build() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
