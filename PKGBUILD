#maintainer: Thomas Mijieux < thomas dot mijieux at hotmail dot fr >
pkgname=osux-visual
pkgver=0.1
pkgrel=1
pkgdesc="GUI tools based on osux-lib"
arch=('i686' 'x86_64')
url="https://github.com/tomtix/osux-visual/"
license=("Apache")
depends=('glib2' 'gtk3' 'gstreamer' 'osux')
source=("https://github.com/tomtix/osux-visual/archive/v$pkgver.tar.gz")
md5sums=('36fdeaf06cf2788f9eb01b780ac6b340')

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
