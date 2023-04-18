# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-dumb-dbus
pkgver=0.1.0
pkgrel=1
pkgdesc="Dumb D-Bus bindings for Emilua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/dumb-dbus"
license=('boost')
depends=('emilua' 'emilua-glib' 'glibmm-2.68')
makedepends=('git' 'meson' 'boost' 'gawk' 'gperf' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/dumb-dbus.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	arch-meson emilua-dumb-dbus build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
