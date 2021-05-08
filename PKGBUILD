# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Artyom 'logus' Pervukhin <logus9@gmail.com>
# Contributor: Tim Yang <tdy@gmx.com>

pkgname=paps
pkgver=0.7.1
pkgrel=2
pkgdesc='Converts Unicode text to postscript and pdf using pango'
url='https://github.com/dov/paps'
arch=('x86_64')
license=('LGPL')
depends=('pango')
makedepends=('intltool')
source=("https://github.com/dov/paps/archive/v${pkgver}.tar.gz")
sha256sums=('b8cbd16f8dd5832ecfa9907d31411b35a7f12d81a5ec472a1555d00a8a205e0e')

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
