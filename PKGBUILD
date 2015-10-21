# Maintainer: TingPing <tingping@tingping.se>

pkgname=retro-plugins-snes
pkgver=0.4
pkgrel=1
pkgdesc='SNES plugin for RetroGobject'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/Kekun/retro-plugins-snes'
source=("https://github.com/Kekun/retro-plugins-snes/releases/download/${pkgver}/retro-plugins-snes-${pkgver}.tar.gz")
sha256sums=('7f56f48a4db567edd0a573ef0ee68c30dc6f051c958895c9f258b352fcea3164')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
