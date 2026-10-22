# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Artyom 'logus' Pervukhin <logus9@gmail.com>
# Contributor: Tim Yang <tdy@gmx.com>

pkgname=paps
pkgver=0.8.1
pkgrel=1
pkgdesc='Converts Unicode text to postscript and pdf using pango'
url='https://github.com/dov/paps'
arch=('x86_64')
license=('LGPL')
depends=('libpaper' 'pango' 'fmt')
makedepends=('intltool')
source=("https://github.com/dov/paps/archive/v${pkgver}.tar.gz")
sha256sums=('603bab59a49a8dd76b2a025919a705d21d44c8e929c72c6ed5e7ad0e87fbc486')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	export CXXFLAGS+=' -fpermissive'
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
