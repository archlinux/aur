# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-botan
pkgver=1.2.1
pkgrel=1
pkgdesc="Securely clears secrets from memory in Emilua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/botan"
license=('boost')
depends=('emilua' 'botan')
makedepends=('git' 'meson' 'boost' 'gawk' 'gperf' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/botan.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
