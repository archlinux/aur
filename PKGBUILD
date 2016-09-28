pkgname=osux-tools
pkgver=0.1
pkgrel=1
pkgdesc="command line tools based on osux-lib"
arch=('i686' 'x86_64')
url="https://github.com/tomtix/osux-tools/"
license=("Apache")
depends=('glib2' 'osux')
source=("https://github.com/tomtix/osux-tools/archive/v$pkgver.tar.gz")
md5sums=('bf9edae3c96bfb9986b49da5331b303e')

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make DESTDIR="$pkgdir" install
}
