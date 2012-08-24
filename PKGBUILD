# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=htmlcxx
pkgver=0.85
pkgrel=3
pkgdesc="A simple non-validating css1 and html parser for C++."
arch=('i686' 'x86_64')
url="http://htmlcxx.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=()
conflicts=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
provides=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
source=("http://heanet.dl.sourceforge.net/project/htmlcxx/htmlcxx/$pkgver/htmlcxx-$pkgver.tar.gz"
        "missing-header.patch")
md5sums=(dbe13c25b5846eb7cbbfa63d85f00f74
         6c89882e310e9945fb0f4cdbb1f965bf)

# Thanks to jgehring for the patch.

build() {
	cd "$srcdir/htmlcxx-$pkgver"
	
	patch -p1 -i "$srcdir/missing-header.patch"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/htmlcxx-$pkgver"
	make DESTDIR="$pkgdir" install
}
