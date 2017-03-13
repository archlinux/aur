# Maintainer: Tom Richards <tom@tomrichards.net>

_pkgname=gnome-games
pkgname=gnome-games-stable
pkgver=3.22.0
pkgrel=2
pkgdesc='A game manager application for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
depends=('grilo' 'retro-gtk' 'libarchive' 'libtracker-sparql')
makedepends=('git' 'intltool' 'automake' 'autoconf' 'vala')
conflicts=('gnome-games-git')
source=("https://git.gnome.org/browse/${_pkgname}/snapshot/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('d0bd820db75bab058e5e555209bddafc2f98051be0002f2fca4969f14a58b7b0')

build() {
	cd "$_pkgname-$pkgver"

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
