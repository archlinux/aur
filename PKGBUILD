Maintainer='Azat Khuzhin <a3at.mail@gmail.com>'
pkgname=popt-deb
pkgdesc='popt with debian patches (mostly to avoid double free)'
pkgver=1.16.10
pkgrel=1
arch=(x86_64)
url='https://github.com/azat/popt'
license=('GPL')
provides=(popt)
conflicts=(popt)
options=('staticlibs')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'libtool' 'make')
source=('git+https://github.com/azat/popt#branch=patched')
md5sums=(SKIP)

build() {
	cd popt
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd popt
	make DESTDIR="$pkgdir/" install
}
