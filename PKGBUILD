# Maintainer: TingPing <tingping@tingping.se>

_gitname=jsk
pkgname=jsk-git
pkgver=6c5143b
pkgrel=1
pkgdesc='Joystick Management Library '
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/Kekun/jsk'
depends=('glib2')
provides=('jsk')
conflicts=('jsk')
makedepends=('autoconf' 'automake' 'intltool' 'libtool' 'vala' 'gobject-introspection')
source=('git+https://github.com/Kekun/jsk.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --tags --always
}

build() {
	cd "$_gitname"

	./autogen.sh --prefix=/usr --enable-introspection
	make
}

package() {
	cd "$_gitname"

	DESTDIR="$pkgdir" make install
}
