# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=ifuse-git
epoch=2
pkgver=1.1.4.r1.g38c9f45
pkgrel=1
pkgdesc='A fuse filesystem to access the contents of an iPhone or iPod Touch'
url='http://libimobiledevice.org/'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('libimobiledevice-git' 'libplist-git' 'fuse')
makedepends=('git')
provides=('ifuse')
conflicts=('ifuse')
source=("git+https://github.com/libimobiledevice/ifuse")
md5sums=('SKIP')

pkgver() {
	cd ifuse

	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd ifuse

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd ifuse

	make DESTDIR="${pkgdir}" install
}
