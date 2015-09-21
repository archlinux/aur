# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sigitas Mazaliauskas <sigisnn at gmail dot com>
# Contributor: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=gtkman
pkgver=0.9
pkgrel=1
pkgdesc='Simple GTK+2 manual page viewer'
arch=('i686' 'x86_64')
url='https://github.com/gapan/gtkman'
license=('GPL')
depends=('python2' 'gtk2')
makedepends=('txt2tags' 'intltool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0b272c0210f5fefdcc1a9dada81aa249edbb5a64122f05f070f9160915fa2a2c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i '1s|python|python2|' src/${pkgname}

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

