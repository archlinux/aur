# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Denis Saintilma <1068des@gmail.com>
# Contributor: Steven Susbauer <stupendoussteve@hotmail.com>

pkgname=ttyload
pkgver=0.5.3
pkgrel=3
pkgdesc="A color-coded console load graph."
arch=('x86_64')
url="https://www.daveltd.com/src/util/ttyload/"
license=('custom')
depends=('glibc')
source=(https://www.daveltd.com/src/util/ttyload/$pkgname-$pkgver.tar.bz2)
sha256sums=('7d3147b22530e6de865279aaad8b9e0348575379413ed1a2d410257baf92d783')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # bug added in 0.5.3
  sed -i '10i #include <time.h>' ttyload.h
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

