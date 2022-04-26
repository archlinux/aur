# Maintainer: Margret Riegert <margret at eowyn net>
# Contributor: Evan M Jones <evanjones4040@gmail.com> 

pkgname=unicon
pkgver=13.2
pkgrel=1
pkgdesc="A modern descendant of the Icon programming language."
arch=(x86_64)
url="https://github.com/uniconproject/unicon/"
license=('GPL2')
conflicts=('icon')
depends=(
    'freetype2'
    'glu'
    'libjpeg-turbo'
    'libnsl'
    'libogg'
    'libvorbis'
    'libxft'
    'openal'
    'sdl'
    'unixodbc'
)
makedepends=('git')
source=("${pkgname}"-"${pkgver}".tar.gz::${url}archive/refs/tags/"${pkgver}".tar.gz)
sha256sums=('0d0be976f12e3cc3067a4949d8f8a7e4a95368dfd015c43c2c76bc4f83fd0039')

build() {
	cd "${srcdir}"/"${pkgname}"-"${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}"/"${pkgname}"-"${pkgver}"
	make DESTDIR="$pkgdir/" install
}

