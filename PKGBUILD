# Maintainer: Flisk <flisk@fastmail.de>

pkgname=wmamixer
pkgver=1.0
pkgrel=1
pkgdesc="an ALSA mixer dockapp for Window Maker"
url="https://github.com/gryf/wmamixer"
license=("GPL2")
depends=('libxext' 'libxpm' 'libx11' 'alsa-lib')
arch=('i686' 'x86_64' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gryf/wmamixer/archive/${pkgver}.tar.gz")
sha256sums=('cccdf0ed4ae0482b16c49560626ad1eea77130fbbfe9e2c971cf49c3d4beb280')

build() {
	make -C "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m755 wmamixer "$pkgdir"/usr/bin/wmamixer
}
