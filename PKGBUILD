# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-secp256k1
pkgver=0.5.1
pkgrel=1
pkgdesc="Emilua bindings to libsecp256k1"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/secp256k1"
license=('mit')
depends=('emilua' 'libsecp256k1')
makedepends=('git' 'meson' 'boost' 'gawk' 'gperf' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/secp256k1.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
