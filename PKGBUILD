# Contributor: David Vachulka <arch_dvx@users.userforge.net>

pkgname=dxirc
pkgver=1.40.1
pkgrel=1
pkgdesc="A simple IRC client"
arch=('i686' 'x86_64')
url="https://dxirc.org"
license=("GPL")
depends=('fox' 'lua' 'qt5-base' 'qt5-multimedia' 'openssl')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e5b46ffcc913de2cfa63721768c5a102')

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
