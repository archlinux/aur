# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=libxtend
pkgver=0.1.8
pkgrel=1
pkgdesc="A library of miscellaneous generic C functions"
arch=('i686' 'x86_64')
url="https://github.com/outpaddling/libxtend"
license=('BSD-2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/outpaddling/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ea58285de2cf104887b0c1be79698dcce3694e315ed3dcd6263ee3edd769f21')

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
