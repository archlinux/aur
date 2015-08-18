# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf2woff
pkgver=0.13
pkgrel=1
pkgdesc='Command line utility converts TrueType and OpenType fonts to the WOFF format.'
arch=('i686' 'x86_64')
url="http://wizard.ae.krakow.pl/~jb/$pkgname/"
license=('GPL')
depends=('zlib')
source=("http://wizard.ae.krakow.pl/~jb/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f349968d24841535567d0aef06010060')
sha1sums=('afdffa63c137e5253b53b5bf6b97427fd61dc010')
sha256sums=('a82e218e3935960f1608fb1ad970ad573cc8fd2819696742d0e5b72322126fad')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make BINDIR="$pkgdir/usr/bin" install
}

