# maintainer: Thomas Mijieux <thomas dot mijieux at hotmail dot fr>
pkgname=osux
pkgver=0.1
pkgrel=1
pkgdesc="little library written in C for the osu game"
arch=('i686' 'x86_64')
url="https://github.com/tomtix/osux-lib/"
license=("Apache")
depends=('glib2' 'xz' 'openssl' 'sqlite')
source=("https://github.com/tomtix/osux-lib/archive/v$pkgver.tar.gz")
md5sums=('b3978d21dd1044aff35ac304b6c7b954')

build() {
	cd "$srcdir/osux-lib-$pkgver/"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/osux-lib-$pkgver/"
	make DESTDIR="$pkgdir" install
}
