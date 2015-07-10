# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: froggie <sullivanva@gmail.com>
# Contributor: ryooichi <ryooichi+aur@gmail.com>

pkgname=ssdeep
pkgver=2.13
pkgrel=1
pkgdesc="A program for computing context triggered piecewise hashes"
arch=('i686' 'x86_64')
url="http://ssdeep.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install || return 1
}
md5sums=('7608b794ce6b25fae8bb1c2f4d35b2ad')
