# Maintainer: aksr <aksr at t-com dot me>
pkgname=lxt
pkgver=1.3b
pkgrel=2
epoch=
pkgdesc="A file manager program, that was inspired by the popular DOS program XTreeGold."
arch=('i686' 'x86_64')
url="http://www.stahlke.org/dan/lxt/"
license=('BSD')
groups=()
depends=('ncurses')
makedepends=()
checkdepends=()
optdepends=()
provides=('lxt')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.stahlke.org/dan/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('3c1c5ac92623165712b24161ccc70935')
sha1sums=('399e0d8588f143a57c697156ce079aff2da510a0')

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
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/license"
}

# vim:set ts=2 sw=2 et:
