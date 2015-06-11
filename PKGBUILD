# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xoo
pkgver=0.9
pkgrel=1
pkgdesc="Simulate an X target display device"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/xoo"
depends=('gtk3')
makedepends=('imake')
install=$pkgname.install
license=('GPL')
source=("http://people.freedesktop.org/~fredinfinite23/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('600f793928b65a7bf2c960dc47c5e6f2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
	--x-libraries="/usr/lib -lX11"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

