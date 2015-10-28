# Contributor: David Vachulka <arch_dvx@users.userforge.net>

pkgname=dxirc
pkgver=1.20.0
pkgrel=1
pkgdesc="A simple IRC client"
arch=('i686' 'x86_64')
url="http://dxirc.org"
license=("GPL")
depends=("fox" "lua" "qt5-base" "qt5-multimedia" "openssl")
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('56faae079b8ef4647732ae24e49774fa')

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
