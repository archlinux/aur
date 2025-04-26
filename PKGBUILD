# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=libxtend
pkgver=0.2.1
pkgrel=1
pkgdesc="A library of miscellaneous generic C functions"
arch=('i686' 'x86_64')
url="https://github.com/outpaddling/libxtend"
license=('BSD-2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/outpaddling/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cc8ced000e9ef2ab801bc540156bbe38518712d54931ffa7b344a6a95ea1571d')

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
