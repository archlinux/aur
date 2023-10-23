# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=libxtend
pkgver=0.2.0
pkgrel=1
pkgdesc="A library of miscellaneous generic C functions"
arch=('i686' 'x86_64')
url="https://github.com/outpaddling/libxtend"
license=('BSD-2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/outpaddling/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ffd35bcc1188054fb51b6c9920d1597285a15a816f5386cf924c2193e3f87c32')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" depend
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share" install
  strip -s "$pkgdir"/usr/lib/libxtend.so.2.0
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
