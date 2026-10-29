# Maintainer: Fabien Pollet <mail@frmpollet.me>

pkgname=wmpulsemixer
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple PulseAudio mixer for WindowMaker"
url="https://github.com/polletfa/wmpulsemixer"
license=("GPL-2.0-only")
depends=('libxext' 'libxpm' 'libx11' 'libpulse' 'gtk3')
options+=('!debug')
arch=('i686' 'x86_64' 'aarch64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/polletfa/wmpulsemixer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4b5529e5cce3808c07a94e2d869327fe6a1440b1536fa60a81162957da7c3000')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
