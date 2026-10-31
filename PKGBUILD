# Maintainer: Fabien Pollet <mail@frmpollet.me>

pkgname=wmpulsemixer
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple PulseAudio mixer for WindowMaker"
url="https://github.com/polletfa/wmpulsemixer"
license=("GPL-2.0-only")
depends=('libxext' 'libxpm' 'libx11' 'libpulse' 'gtk3')
options+=('!debug')
arch=('i686' 'x86_64' 'aarch64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/polletfa/wmpulsemixer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8bc6693b864fbd256c35cb1ee79543636ae0436d3a13ef5f573647b4a3aa5385')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
