# Maintainer: Robert Pannick <rwpannick@gmail.com>
# Contributor: Colean <colean@colean.cc>
pkgname=bipscript
pkgver=0.17
pkgrel=1
pkgdesc="A scripting language for interactive music"
arch=('i686' 'x86_64')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('boost-libs' 'fftw' 'lilv' 'liblo' 'libsndfile' 'portsmf')
makedepends=('cmake' 'boost' 'lv2' 'jack2' 'git')
provides=("bipscript")
conflicts=("bipscript")
source=("$pkgname"::"git+https://gitlab.domainepublic.net/bipscript/bipscript.git")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
