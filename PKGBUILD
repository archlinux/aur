pkgname=astrofocuser
pkgver=1.1.3
pkgrel=1
pkgdesc="A tool to help star focusing in astrophotogaphy using FWHM method"
url="http://sourceforge.net/projects/astrofocuser/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt4')
#optdepends=('sdl')
makedepends=('cmake')
source=("http://sourceforge.net/projects/astrofocuser/files/release/astrofocuser_${pkgver}_src.tar.gz")
sha1sums=('1fc947e0874e7673b7aa9671d1f9be1c9ee67130')

build() {
	cd "${srcdir}/${pkgname}_${pkgver}_src"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}_${pkgver}_src"
	make DESTDIR=$pkgdir install
}

