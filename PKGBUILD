# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf2woff
pkgver=0.12
pkgrel=1
pkgdesc='Command line utility converts TrueType and OpenType fonts to the WOFF format.'
arch=('i686' 'x86_64')
url="http://wizard.ae.krakow.pl/~jb/$pkgname/"
license=('GPL')
depends=('zlib')
source=("http://wizard.ae.krakow.pl/~jb/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7cc5c17ed50777ca5a1ba0ae980ec78d')
sha1sums=('7d0aee194903344cff674921fefd38b5bdca61fd')
sha256sums=('2babb4a51903f1dca1453e9802a91157a4525b285a2bc40ed393adc1efe742b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make BINDIR="$pkgdir/usr/bin" install
}

