# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=prefixsuffix
pkgver=0.6.9
pkgrel=1
pkgdesc='A GUI application that renames batches of files by changing the beginning or end of their names.'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/murraycu/${pkgname}"
depends=('gtkmm3')
makedepends=('gnome-common' 'mm-common')
options=('!emptydirs')
install=prefixsuffix.install
source=("https://github.com/murraycu/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('d5e598d8f1a49dc4678a6b40d7ae226e')
provides=("prefixsuffix=$pkgver")

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
