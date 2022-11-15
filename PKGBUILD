# Maintainer: Steven Xu <mail@stevendoesstuffs.dev>
# Contributor: Merell Matlock <mlmatlock@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Sigitas Mazaliauskas <sigisnn@gmail.com>
# Contributor: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=gtkman
pkgver=2.3.2
pkgrel=1
pkgdesc='Simple GTK+3 manual page viewer'
arch=('i686' 'x86_64')
url='https://github.com/gapan/gtkman'
license=('GPL3')
makedepends=('txt2tags' 'intltool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gapan/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0fbd0b238561a5992458e9a1dbe83bd48f6addda51c16ebdde0674eb4240a617')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
