# Maintainer: Tomáš Mládek <t@mldk.cz>
pkgname=graph2dot
pkgver="4.3.1"
pkgrel="1"
pkgdesc="parse a filtergraph description and issue a corresponding textual representation in the dot language"
arch=('i686' 'x86_64')
url="https://ffmpeg.org"
license=('LGPL 2.1')
source=("${url}/releases/ffmpeg-${pkgver}.tar.gz")
makedepends=('yasm')
optdepends=('graphviz')
sha256sums=('45035f15d6f192772de2309c846e1d60472694f479679354a39c699719e53772')

build() {
	cd "ffmpeg-$pkgver"
	./configure
	make -j 4 tools/graph2dot
}

package() {
	install -D -v -t $pkgdir/usr/bin -s "ffmpeg-$pkgver/tools/graph2dot"
}
