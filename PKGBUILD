# Maintainer: Mike Phipps <qrz@k8wu.me>
# Contributor: Brian Salcedo <brian@salcedo.tech>
# Contributor: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flmsg
pkgver=4.0.24
pkgrel=1
pkgdesc="Forms management editor for Amateur Radio standard message formats"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.org/"
groups=('w1hkj')
license=('GPL')
depends=('fldigi')
source=(https://www.w1hkj.org/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('93340798d0f9ccafc7cb8d19d1146cb67279c79723c436b1d25da276399e0694')

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
