# Maintainer: BrainDamage
# Contributor: Marco von Rosenberg <codingmarco@gmail.com>

pkgname=mlrpt
pkgver=1.7.1
pkgrel=1
pkgdesc="Non-interactive command-line version of glrpt for receiving, decoding and saving LRPT images from the Russian Meteor-M type of weather satellites"
arch=('x86_64' 'aarch64' 'armv7h')
url="http://www.5b4az.org"
license=('GPL-3.0-only')
depends=('rtl-sdr' 'airspy')
makedepends=('automake' 'autoconf')
source=("http://www.5b4az.org/pkg/lrpt/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('fff3971322fd12297429edde129078edbdd6c336afeb88fd548f66ad88d915ef')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
