# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Flisk <flisk@fastmail.de>

pkgname=wmamixer
pkgver=1.1
pkgrel=1
pkgdesc="an ALSA mixer dockapp for Window Maker"
url="https://github.com/gryf/wmamixer"
license=("GPL2")
depends=('libxext' 'libxpm' 'libx11' 'alsa-lib')
options+=('!debug')
arch=('i686' 'x86_64' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gryf/wmamixer/archive/${pkgver}.tar.gz")
sha256sums=('362a5544a5abd626e47d19d7a1d5d6c1a32a94d5b541dfa2f09891865e466536')

build() {
	make -C "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m755 wmamixer "$pkgdir"/usr/bin/wmamixer
}
