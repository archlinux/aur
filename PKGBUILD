# Maintainer: TingPing <tingping@tingping.se>

_gitname=gnome-games
pkgname=gnome-games-git
pkgver=3.18.0.r0.g9fbaeca
pkgrel=1
pkgdesc='A game manager application for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
install='gnome-games.install'
provides=('gnome-games')
conflicts=('gnome-games')
depends=('retro-gtk' 'libarchive' 'libtracker-sparql')
makedepends=('git' 'intltool' 'automake' 'autoconf' 'vala')
source=('git+https://github.com/Kekun/gnome-games.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"

	git describe --tags --long | sed 's/-/.r/; s/-/./'
}

build() {
	cd "$_gitname"

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$_gitname"

	DESTDIR="$pkgdir" make install
}
