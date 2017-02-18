# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=ifuse-git
epoch=2
pkgver=1.1.3.r4.gdf048a1
pkgrel=1
pkgdesc='A fuse filesystem to access the contents of an iPhone or iPod Touch'
url='http://libimobiledevice.org/'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('libimobiledevice-git' 'libplist-git' 'fuse')
makedepends=('git')
provides=('ifuse')
conflicts=('ifuse')
source=("git+https://git.libimobiledevice.org/ifuse.git")
md5sums=('SKIP')

pkgver() {
	cd ifuse

	git describe --long | sed 's/-/.r/;s/-/./'
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
