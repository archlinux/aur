# gandalf3 <gandalf3@blendermonkey.com>

pkgname=swami
pkgver=2.2.2
pkgrel=1
pkgdesc='A SoundFont editor'
arch=('x86_64')
url='http://www.swamiproject.org'
license=('GPL2')
depends=('gtk2' 'fftw' 'audiofile' 'fluidsynth' 'libinstpatch' 'libgnomecanvas')
makedepends=('cmake')
optdepends=('libpng')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swami/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('e7ac70719d55f66630677a2907e23389ddb5b5bf')

build() {
	cd "${pkgname}-${pkgver}"
	cmake -Wno-dev -D CMAKE_SKIP_RPATH=YES\
	               -D CMAKE_BUILD_TYPE=Release\
	               -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install/strip
}
