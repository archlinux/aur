# Maintainer: Brian Salcedo <brian@salcedo.tech>
# Contributor: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flmsg
pkgver=4.0.19
pkgrel=2
pkgdesc="Forms management editor for Amateur Radio standard message formats"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/"
groups=('w1hkj')
license=('GPL')
depends=('fldigi')
source=(http://www.w1hkj.com/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('3e6e6a01435b7a7917f55dce490596d3d888451fd60758c1e22a324426668eab')

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
