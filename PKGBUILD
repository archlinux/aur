# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=htmlcxx
pkgver=0.85
pkgrel=1
pkgdesc="A simple non-validating css1 and html parser for C++."
arch=('i686' 'x86_64')
url="http://htmlcxx.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=()
conflicts=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
provides=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
source=("http://kent.dl.sourceforge.net/project/htmlcxx/htmlcxx/$pkgver/htmlcxx-$pkgver.tar.gz")
md5sums=(dbe13c25b5846eb7cbbfa63d85f00f74)

build() {
	cd "$srcdir/htmlcxx-$pkgver"
	
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/htmlcxx-$pkgver"
	make DESTDIR="$pkgdir" install
}
