# Maintainer: James Reed <supplantr at archlinux dot info>
# Contributor: Leslie P. Polzer <polzer at stardawn dot org>

pkgname=gnuit
pkgver=4.9.5
pkgrel=1
pkgdesc="A set of interactive text-mode tools."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnuit/"
license=('GPL3')
depends=('bash')
install=${pkgname}.install
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6b88eea39361ead2ad48b33b17a870f5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-transition
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

