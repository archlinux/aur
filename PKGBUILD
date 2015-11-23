# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: triaxx

pkgname=gnuclad
pkgver=0.2.4
pkgrel=2
pkgdesc="A cladogram tree generator mainly used by GNU/Linux distro timeline project"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/gnuclad"
depends=()
source=(http://launchpad.net/gnuclad/trunk/0.2/+download/$pkgname-$pkgver.tar.gz)
md5sums=('5ca520333ee496a1d2e49f14d0b9549e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
