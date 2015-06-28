# Maintainer: aksr <aksr at t-com dot me>
pkgname=gxe
pkgver=1.28
pkgrel=1
epoch=
pkgdesc="Hybrid Editor XE, for working on both main-frame (SPF editor) and PC."
arch=('i686' 'x86_64')
url="http://www.geocities.jp/sakachin2/index.htm"
license=('GPL')
groups=()
depends=('libgnomeui')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.geocities.jp/sakachin2/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('65c29721a32cea38914f0209ae0fd854')
sha1sums=('37b85ec8e7f2fccb7584161c762da5b4db36ecd6')
sha256sums=('9588245d50bba8fbb61db46adbd3086a4d4decf7793ec3afcf8701f5664b3f9b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/gxe/{en,ja}
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/en/* $pkgdir/usr/share/doc/$pkgname/en/
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/ja/* $pkgdir/usr/share/doc/$pkgname/ja/
}

