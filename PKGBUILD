# contributed by tomdeb <tomdeb@gmail.com>
#
pkgname=apwal
pkgver=0.4.5
pkgrel=2
pkgdesc="Apwal is a simple application launcher for Linux together with a powerful editor. "
url="http://apwal.free.fr"
license="GPL"
arch=('i686' 'x86_64')
depends=('gtk2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://apwal.free.fr/download/$pkgname-$pkgver.tar.gz")
md5sums=('2f15a1a680f842d8373a1c2725b53130')

build() {
  cd "$srcdir/$pkgname"
  make || return 1
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname/src/apwal" "$pkgdir/usr/bin/"
  ln -s "apwal" "$pkgdir/usr/bin/apwal-editor"
}
