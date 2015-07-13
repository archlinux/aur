# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=yawa-git
pkgver=0.9.0.r18.g31af564
pkgrel=1

pkgdesc='A tool which allows you to compose wallpapers for X.'
url='http://git.kyriasis.com/kyrias/yawa/about/'
arch=('i686' 'x86_64')
license=('GPL2')

depends=('imlib2' 'libx11' 'libbsd')
makedepends=('clang' 'cmake' 'git' 'python-sphinx')

source=('git+http://git.kyriasis.com/kyrias/yawa')

sha1sums=('SKIP')

pkgver() {
	cd yawa
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd yawa
	cmake -g 'Unix Makefiles' . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd yawa
	make DESTDIR="$pkgdir" install
}
