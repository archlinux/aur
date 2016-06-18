# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sigitas Mazaliauskas <sigisnn at gmail dot com>
# Contributor: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=gtkman
pkgver=1.0
pkgrel=1
pkgdesc='Simple GTK+2 manual page viewer'
arch=('i686' 'x86_64')
url='https://github.com/gapan/gtkman'
license=('GPL')
depends=('pygtk')
makedepends=('txt2tags' 'intltool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1723d9f578b8ebaf4b375f840dd631c222c08358214e9f258cce543c67b6a397')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i '1s|python|python2|' src/${pkgname}
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

