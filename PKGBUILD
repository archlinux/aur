# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf2woff
pkgver=1.2
pkgrel=1
pkgdesc='Command line utility converts TrueType and OpenType fonts to the WOFF format.'
arch=('i686' 'x86_64')
url="http://wizard.ae.krakow.pl/~jb/$pkgname/"
license=('GPL')
depends=('zlib')
source=("http://wizard.ae.krakow.pl/~jb/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4a29815b2a51ae13dc01ef1508b73007')
sha1sums=('a7121951551c75c418723be0f1e5563322d004a2')
sha256sums=('77c5c47e9d9b74a1d8701c4a7094f1c05ea0c982fb318466b35d63aff2125509')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make BINDIR="$pkgdir/usr/bin" install
}

