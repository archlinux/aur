# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-ini
pkgver=1.0.1
pkgrel=1
pkgdesc="INI library for Emilua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/ini"
license=('boost')
depends=('emilua')
makedepends=('git' 'meson' 'boost' 'gawk' 'gperf' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/ini.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
