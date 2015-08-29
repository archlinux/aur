# Maintainer: spider-mario <spidermario@free.fr>
pkgname=sacd-extract
pkgver=0.3.8
pkgrel=1
pkgdesc="Extract DSD files from an SACD image"
arch=('i686' 'x86_64')
url="https://sourceforge.net/p/sacd-ripper/"
license=('GPL2')
depends=('glibc')
makedepends=('cmake' 'svn')
source=('sacd-ripper::svn+http://svn.code.sf.net/p/sacd-ripper/code/trunk#revision=399')
sha512sums=(SKIP)

build() {
	rm -fr build
	mkdir build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release ../sacd-ripper/tools/sacd_extract/

	make
}

package() {
	cd build

	install -Dm755 sacd_extract "$pkgdir"/usr/bin/sacd_extract
}
