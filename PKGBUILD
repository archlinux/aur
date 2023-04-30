# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-qt6
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt6 bindings for Emilua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/qt6"
license=('boost')
depends=('emilua' 'qt6-declarative')
makedepends=('git' 'meson' 'boost' 'gawk' 'gperf' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/qt6.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
