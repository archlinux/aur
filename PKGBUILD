# Maintainer: Brian Salcedo <brian@salcedo.tech>
# Contributor: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flamp
pkgver=2.2.13
pkgrel=1
pkgdesc="A program for the Amateur Multicast Protocol"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/"
license=('GPL')
groups=('w1hkj')
depends=('fldigi')
source=(http://www.w1hkj.com/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('2dafcf63176b35e5d0a236c141c42f8cd9c5d690f7691e7d6eed6f2b5d590da2')

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
