# Maintainer: Kristóf Jakab <jaksi@jaksi.io>
pkgname=libzorpll
pkgver=6.0.6.0
pkgrel=2
pkgdesc='Low level library functions for Zorp'
arch=('x86_64')
url='https://github.com/balabit/libzorpll'
license=('LGPL')
depends=('glib2' 'libcap' 'openssl')
source=('https://github.com/balabit/libzorpll/archive/v6.0.6.0.tar.gz')
md5sums=('6a382bf03ed3b6a88651e184031918c0')

build() {
	cd "$srcdir/libzorpll-6.0.6.0"
	./autogen.sh
	./configure --prefix=/usr --libexecdir=/usr/lib/libzorpll
	make
}

package() {
	cd "$srcdir/libzorpll-6.0.6.0"
	make DESTDIR="$pkgdir/" install
	rm -r "$pkgdir/usr/var/"
}
