# Contributor: Sebastain Wolf <fatmike303 at gmail.com>
pkgname=cbmconvert
pkgver=2.1.4
pkgrel=1
pkgdesc="Create, extract and convert 8-bit Commodore binary archives"
arch=('i686' 'x86_64')
url="https://github.com/dr-m/cbmconvert"
license=('GPL')
source=(https://github.com/dr-m/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz)
sha256sums=('9e82e9b281bc014dd3a283fd173f6fccc43043851a8926cac6be9b17ef68e3dc')

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
