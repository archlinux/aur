# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=haste-applet
pkgver=0.2.8
pkgrel=0.1
pkgdesc="A Budgie applet for the haste service."
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/cybre/${pkgname}"
sha256sums=('24eab3b109627d96d0218f389aad4420fedbb52ecfa320d2ca896ccc217b9bca')
depends=('libpeas' 'budgie-desktop' 'libsoup')
makedepends=('gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools')
source=(https://github.com/cybre/${pkgname}/archive/${pkgver}.tar.gz)

build() {
	cd "$srcdir/budgie-${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr  --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/budgie-${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
