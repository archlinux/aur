# Maintainer: boyska <piuttosto@logorroici.org>

pkgname=podiff
pkgver=1.1
pkgrel=2
pkgdesc="Diff tool for PO Gettext files"
url="http://puszcza.gnu.org.ua/projects/podiff"
arch=(i686 x86_64)
license=('GPL')
depends=()
makedepends=()
conflicts=('pyg3t')
source=("http://download.gnu.org.ua/pub/release/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make allclean
  make y.tab.h
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make DESTDIR="$pkgdir" install
}
sha256sums=('a97480109c26837ffa868ff629a32205622a44d8b89c83b398fb17352b5be6ff')
md5sums=('56d8f879c138bb9688334d4c3a4fd85f')
