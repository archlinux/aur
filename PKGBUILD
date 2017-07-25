# Maintainer: Joan Figueras <ffigue {at} gmail {dot} com>

pkgname=gtk-theme-arc-red
_pkgname=arc-theme-Red
pkgver=20160626
pkgrel=3
pkgdesc="A red variation of Horst3180's Arc Theme. A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (supported until version 3.20)."
arch=('any')
url="https://github.com/mclmza/arc-theme-Red"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
source=("https://github.com/mclmza/${_pkgname}/archive/1.tar.gz")
sha256sums=('1de29a4a4069b7357736f73ff2d6061ff5520ea592a5dcd1084337cb2e1528ce')

prepare() {
	cd "${srcdir}/${_pkgname}-1/common/gnome-shell"
	ln -sf 3.18 3.22
	cd "../gtk-3.0"
	ln -sf 3.20 3.22
}

build() {
	cd "${srcdir}/${_pkgname}-1"
	./autogen.sh --prefix=/usr
}

package() {
	make -C "${srcdir}/${_pkgname}-1" DESTDIR="${pkgdir}" install
}

