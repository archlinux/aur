# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-annotations'
pkgver='0.2.0'
pkgrel=1
pkgdesc='Annotate files and directories'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-annotations'
license=('GPL')
depends=('glib2' 'gtksourceview4' 'libnautilus-extension')
makedepends=('intltool')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('a9d3989d44baac76aa82703f3e317378116877b3d343011cb9f20dd82a398ea1')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	make DESTDIR="${pkgdir}" install

}

