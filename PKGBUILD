# Maintainer: Tom Richards <tom@tomrichards.net>

_pkgname=gnome-games
pkgname=gnome-games-stable
pkgver=3.21.92
pkgrel=1
pkgdesc='A game manager application for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
depends=('retro-gtk' 'libarchive' 'libtracker-sparql')
makedepends=('git' 'intltool' 'automake' 'autoconf' 'vala')
conflicts=('gnome-games-git')
source=("https://git.gnome.org/browse/${_pkgname}/snapshot/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('47870af3bebf74419a21dd7582e3e90135dab9588e1f73d850e5680247431c47')

build() {
	cd "$_pkgname-$pkgver"

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
