# Maintainer: Brian Salcedo <brian@salcedo.tech>
# Contributor: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flmsg
pkgver=4.0.20
pkgrel=1
pkgdesc="Forms management editor for Amateur Radio standard message formats"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/"
groups=('w1hkj')
license=('GPL')
depends=('fldigi')
source=(http://www.w1hkj.com/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('4ec630776b94189b307a22a28135813d703b3ed22d65e20ec4a937955deccb6e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --without-flxmlrpc
  make
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  make -k check
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
