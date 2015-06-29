# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sigitas Mazaliauskas <sigisnn at gmail dot com>
# Contributor: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=gtkman
pkgver=0.7.2
pkgrel=4
pkgdesc='Simple GTK+2 manual page viewer'
arch=('i686' 'x86_64')
url='https://github.com/gapan/gtkman'
license=('GPL')
depends=('python2' 'gtk2')
makedepends=('txt2tags' 'intltool')
source=("http://people.salixos.org/gapan/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0c383bae00eff086b1fc5b3cac2e144fbb09d1f724e1ee155602d953cfa2a113')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' src/${pkgname}
	sed -i 's|/usr/man/|/usr/share/man/|g' install.sh

	./compile.sh
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" ./install.sh
}

