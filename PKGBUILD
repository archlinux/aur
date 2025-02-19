# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-this-thread
pkgver=1.0.2
pkgrel=1
pkgdesc="Access C++'s this_thread from Lua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/this-thread"
license=('boost' 'mit')
depends=('emilua')
makedepends=('git' 'meson' 'boost' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/this-thread.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
