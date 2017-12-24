# Maintainer: aksr <aksr at t-com dot me>
pkgname=gxe
pkgver=1.29
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
source=("http://www.geocities.jp/sakachin2/$pkgname-${pkgver}.tar.gz")
noextract=()
md5sums=('adb2e190b6ac61a0aeb370534891fa48')
sha1sums=('aedb6ad4c357a4b16c31c7f97755402311f8fe3a')
sha256sums=('244c592f1b19f1ca390d532bc3bf114cba89083c6bb46570ca78a73f04f43800')

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
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/doc/gxe/{en,ja}
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/en/* $pkgdir/usr/share/doc/$pkgname/en/
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/ja/* $pkgdir/usr/share/doc/$pkgname/ja/
}

