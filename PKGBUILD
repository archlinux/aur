# Maintainer: Thorsten Wissmann <edu _at_ thorsten-wissmann _dot_ de>
# Contributor: Javier "Phrodo_00" Aravena <phrodo.00@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-rezlooks
pkgver=0.6.1
pkgrel=1
pkgdesc="Clean looking gtk theme engine based on the cairo-enabled CVS clearlooks engine code."
arch=('i686' 'x86_64')
url="https://www.gnome-look.org/p/1080201/"
license=('GPL')
depends=('gtk2')
options=('!libtool')
# the previous name was gtk-rezlooks-engine, but nowadays, all gtk engine
# packages have the prefix 'gtk-engine-'
conflicts=('gtk-rezlooks-engine')
replaces=('gtk-rezlooks-engine')
source=( "https://github.com/t-wissmann/rezlooks-gtk-engine/archive/refs/tags/v${pkgver}.tar.gz" )
sha256sums=('6c1a9d02c9cbadb70f5a229401b91046a70f68afe17a5f701e9eae6dd8cce906')

prepare() {
	cd "${srcdir}/rezlooks-gtk-engine-${pkgver}/rezlooks"
	./configure --prefix=/usr --enable-animation
}

build() {
	cd "${srcdir}/rezlooks-gtk-engine-${pkgver}/rezlooks"
	make
}

package() {
	cd "${srcdir}/rezlooks-gtk-engine-${pkgver}/rezlooks"

	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}/usr/share/themes"
}
