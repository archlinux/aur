pkgname=coan
pkgver=6.0.1
pkgrel=2
pkgdesc='Modify C/C++ code using prepocessor statements'
arch=('any')
url='http://coan2.sourceforge.net'
license=(BSD)
makedepends=(time)
source=("https://downloads.sourceforge.net/project/${pkgname}2/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('84704f484129f7c6ab6dffb5a7fecaa4cae65b32422e2a4c010c8666810c04b4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CXXFLAGS="$CXXFLAGS -std=c++11"
	./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
}
