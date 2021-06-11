# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-annotations'
pkgver='0.8.1'
pkgrel=1
pkgdesc='Annotate files and directories'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-annotations'
license=('GPL')
depends=('glib2' 'gtksourceview4' 'libnautilus-extension')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('687f14f2a250a634e2a412c8843506977b063029baa61d3563701b20d86933ad')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

