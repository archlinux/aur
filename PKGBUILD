# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=residualvm-git
pkgver=r5870.d4b7b14
pkgrel=1
pkgdesc="A cross-platform 3D game interpreter which allows you to play LucasArts' LUA-based 3D adventures"
arch=('i686' 'x86_64')
url='http://www.residualvm.org'
license=(GPL)
depends=('sdl' 'zlib' 'alsa-lib' 'libmad' 'mesa' 'libmpeg2' 'freetype2' 'libjpeg-turbo')
makedepends=('git')
source=(git://github.com/residualvm/residualvm.git)
sha1sums=('SKIP')

pkgver() {
	cd residualvm
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd residualvm
	./configure --prefix=/usr --enable-release
	make
}

package() {
	cd residualvm
	make DESTDIR=${pkgdir} install
}
