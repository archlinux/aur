# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=tg
pkgver=0.5.0
pkgrel=2
pkgdesc="An advanced cross-platform solution for timing mechanical watches, a timegrapher. Also known as tg-timer."
arch=('x86_64')
url="https://github.com/vacaboja/tg"
license=('GPL2')
depends=('gtk3' 'portaudio' 'fftw')
provides=('tg-timer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vacaboja/tg/archive/v0.5.0.tar.gz")
md5sums=('92f548e6a25b003e77f9613bf26cb940')

build() {
    cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
    cd "$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
