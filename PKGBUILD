# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=prefixsuffix
pkgver=0.6.3
pkgrel=1
pkgdesc='A GUI application that renames batches of files by changing the beginning or end of their names.'
arch=('i686' 'x86_64')
license=('GPLv2')
url="https://github.com/murraycu/${pkgname}"
depends=('gtkmm3')
makedepends=('gnome-common' 'mm-common')
options=('!emptydirs')
install=prefixsuffix.install
source=("https://github.com/murraycu/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('d368e8509d0304d9feb49ee1c242db94')
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
