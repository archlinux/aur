# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=libxtend
pkgver=0.1.7
pkgrel=5
pkgdesc="A library of miscellaneous generic C functions"
arch=('i686' 'x86_64')
url="https://github.com/outpaddling/libxtend"
license=('BSD-2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/outpaddling/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('46176850e70b48bf0d49f60ea338121dac9ec35cb9706b226fd031ff5a758fd0')

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
