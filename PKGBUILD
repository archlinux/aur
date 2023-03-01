# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Artyom 'logus' Pervukhin <logus9@gmail.com>
# Contributor: Tim Yang <tdy@gmx.com>

pkgname=paps
pkgver=0.8.0
pkgrel=1
pkgdesc='Converts Unicode text to postscript and pdf using pango'
url='https://github.com/dov/paps'
arch=('x86_64')
license=('LGPL')
depends=('pango' 'fmt')
makedepends=('intltool')
source=("https://github.com/dov/paps/archive/v${pkgver}.tar.gz")
sha256sums=('8fd8db04e6f8c5c164806d2c1b5fea6096daf583f83f06d1e4813ea61edc291f')

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
