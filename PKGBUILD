# Maintainer: Mike Phipps <qrz@k8wu.me>
# Contributor: Brian Salcedo <brian@salcedo.tech>
# Contributor: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flamp
pkgver=2.2.14
pkgrel=1
pkgdesc="A program for the Amateur Multicast Protocol"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/"
license=('GPL')
groups=('w1hkj')
depends=('fldigi')
source=(https://www.w1hkj.org/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('db8f7dd481db7661c80d7afaa43b044360ee6072d3f3faa1f362b1043a421cb2')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
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
