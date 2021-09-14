# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-annotations'
pkgver='0.8.3'
pkgrel=1
pkgdesc='Annotate files and directories'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-annotations'
license=('GPL')
depends=('glib2' 'gtksourceview4' 'libnautilus-extension')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('b28cecc7cb5055a2f2f0617e1ef78f212bbbfd9f20320ff3f8b2cb8496f07a0d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

