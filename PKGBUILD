# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-annotations'
pkgver='0.10.1'
pkgrel=1
pkgdesc='Annotate files and directories'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-annotations'
license=('GPL')
depends=('glib2' 'gtksourceview5' 'libnautilus-extension')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('36a4482a651795a81682ef3a1f3384ade48bcca666550e7444f420096de70b79')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

