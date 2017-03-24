# Maintainer: aksr <aksr at t-com dot me>
pkgname=gxe
pkgver=1.28
pkgrel=3
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
source=("http://www.geocities.jp/sakachin2/$pkgname-${pkgver}.tar.gz")
noextract=()
md5sums=('e8ec3ee9b8c04ea521c5d42cac171045')
sha1sums=('f30bdcf829c061c30329bea712c2cb378583a802')
sha256sums=('81960e233d835749790e454d2bd74cdacff7b5af4c982bdb740e728dee7040c9')

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
  make DESTDIR="$pkgdir/usr" install
  mkdir -p $pkgdir/usr/share/doc/gxe/{en,ja}
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/en/* $pkgdir/usr/share/doc/$pkgname/en/
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/ja/* $pkgdir/usr/share/doc/$pkgname/ja/
}

