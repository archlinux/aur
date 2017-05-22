# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf2woff
pkgver=0.14
pkgrel=1
pkgdesc='Command line utility converts TrueType and OpenType fonts to the WOFF format.'
arch=('i686' 'x86_64')
url="http://wizard.ae.krakow.pl/~jb/$pkgname/"
license=('GPL')
depends=('zlib')
source=("http://wizard.ae.krakow.pl/~jb/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6f63861dde18a8a4177153760912864a')
sha1sums=('fb663b4b627b82786c407ece93a8ac82d70b25e7')
sha256sums=('21d77e227c993f6f05082a02352a12887396a0ce65177f41177fd9032f35aa45')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make BINDIR="$pkgdir/usr/bin" install
}

