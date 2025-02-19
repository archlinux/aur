# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-bech32
pkgver=1.1.1
pkgrel=1
pkgdesc="Bech32 codec for Emilua"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/bech32"
license=('mit')
depends=('emilua')
makedepends=('git' 'meson' 'boost' 'asciidoctor' 'range-v3')
source=("${pkgname}::git+https://gitlab.com/emilua/bech32.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
