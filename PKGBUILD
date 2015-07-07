# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=ifuse-git
epoch=2
pkgver=1.1.3.r2.g988161f
pkgrel=1
pkgdesc='A fuse filesystem to access the contents of an iPhone or iPod Touch'
url='http://libimobiledevice.org/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libimobiledevice-git' 'gnutls' 'libusb' 'fuse' 'glib2' 'libxml2' 'libxml++')
makedepends=('gcc' 'git' 'automake' 'autoconf' 'fakeroot' 'make' 'pkgconfig')
provides=('ifuse')
conflicts=('ifuse')

source=("git://git.sukimashita.com/ifuse.git")
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
