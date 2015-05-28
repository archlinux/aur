# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmixer
pkgver=1.5
pkgrel=3
pkgdesc="A mixer application written for the WindowMaker dock."
arch=('i686' 'x86_64')
url="http://windowmaker.org/dockapps/?name=$pkgname"
license=('GPL')
depends=('libxpm')
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz"
	"wmmixer.patch")
md5sums=('SKIP'
         '2b79b2be0ae022b0dd68ea966b28e65b')

build() {
  cd "$srcdir"/dockapps-ad70c26
  patch -p1 <"$srcdir/wmmixer.patch"
  make prefix=/usr
}

package() {
  cd "$srcdir"/dockapps-ad70c26
  make prefix=/usr DESTDIR="$pkgdir" install
}
