# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmixer
pkgver=1.7+20141005
pkgrel=1
pkgdesc="A mixer application written for the WindowMaker dock."
arch=('i686' 'x86_64')
url="http://windowmaker.org/dockapps/?name=$pkgname"
license=('GPL')
depends=('libxpm')
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/dockapps-*
  make prefix=/usr
}

package() {
  cd "$srcdir"/dockapps-*
  make prefix=/usr DESTDIR="$pkgdir" install
}
