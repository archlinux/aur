# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=libxtend
pkgver=0.1.9
pkgrel=1
pkgdesc="A library of miscellaneous generic C functions"
arch=('i686' 'x86_64')
url="https://github.com/outpaddling/libxtend"
license=('BSD-2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/outpaddling/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ef3a3c6f6272391416fd3712893cb90d8350278494216acbe3249c77b175f1a8')

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
