# Maintainer: Fabien Pollet <mail@frmpollet.me>

pkgname=wmpulsemixer
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple PulseAudio mixer for WindowMaker"
url="https://github.com/polletfa/wmpulsemixer"
license=("GPL-2.0-only")
depends=('libxext' 'libxpm' 'libx11' 'libpulse')
options+=('!debug')
arch=('i686' 'x86_64' 'aarch64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/polletfa/wmpulsemixer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4625d13934f9a655e8cb7b5907865edde465e34b51aa3b335d6fb81465ab98c2')

build() {
	make -C "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
