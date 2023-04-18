# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-glib
pkgver=0.3.0
pkgrel=1
pkgdesc="GLib event loop integration for Emilua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/glib"
license=('boost')
depends=('emilua')
makedepends=('git' 'meson' 'boost')
source=("${pkgname}::git+https://gitlab.com/emilua/glib.git#tag=v${pkgver}")
md5sums=('SKIP')
#validpgpkeys=()

build() {
	arch-meson emilua-glib build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
