# Contributor: Sebastain Wolf <fatmike303 at gmail.com>
pkgname=cbmconvert
pkgver=2.1.6
pkgrel=1
pkgdesc="Create, extract and convert 8-bit Commodore binary archives"
arch=('i686' 'x86_64')
url="https://github.com/dr-m/cbmconvert"
license=('GPL')
source=(https://github.com/dr-m/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz)
sha256sums=('37a42cbdaffd5f1fdfec9138be23fd1588f28e695e6958d4412f745bb84c6428')

build() {
  cd $srcdir/$pkgname-$pkgname-$pkgver
	cmake -B build  || return 1
	cmake --build build || return 1
	ctest --test-dir build || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgname-$pkgver/build
	cmake --install . --prefix $pkgdir/usr
}
