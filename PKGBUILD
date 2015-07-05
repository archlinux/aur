pkgname=astroavibrowser
pkgver=0.4
pkgrel=1
pkgdesc="A small tool for astronomy video sequences editing."
url="http://sourceforge.net/projects/astroavibrowser/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('ffmpeg' 'qt4')
#optdepends=('sdl')
makedepends=('gcc' 'cmake')
source=('http://sourceforge.net/projects/astroavibrowser/files/Releases/astroavibrowser_0.4_src.tar.gz')
sha1sums=('f4e1953cdb1a96bdce613db51e6774ffe67047db')

build() {
	cd "${srcdir}/${pkgname}_${pkgver}_src"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}_${pkgver}_src"
	make DESTDIR=$pkgdir install
}

