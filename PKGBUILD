# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-date
pkgver=2.4.0
pkgrel=2
pkgdesc="Chinese lunar date library."
arch=("i686" "x86_64")
url="http://code.google.com/p/liblunar/"
license=('GPL2')
depends=('glib2>=2.12')
makedepends=('intltool')
source=("http://liblunar.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('fe84d67b5a6d5a99927c80855c89ebd9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install || return 1
}


