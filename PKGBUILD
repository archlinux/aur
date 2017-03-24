# Maintainer: Tom Richards <tom@tomrichards.net>

_pkgname=gnome-games
pkgname=gnome-games-stable
pkgver=3.24.0
pkgrel=1
pkgdesc='A game manager application for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
depends=('grilo' 'retro-gtk' 'libarchive' 'libtracker-sparql')
makedepends=('git' 'intltool' 'automake' 'autoconf' 'vala')
conflicts=('gnome-games-git')
source=("https://git.gnome.org/browse/${_pkgname}/snapshot/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('ccefce9d11bf04bc7b226d225d5ef27c16eb0b1ad5d34c01efc10fedf1ff6734')

build() {
	cd "$_pkgname-$pkgver"

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
