# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=tg
pkgver=0.6.0
pkgrel=1
pkgdesc="An advanced cross-platform solution for timing mechanical watches, a timegrapher. Also known as tg-timer."
arch=('x86_64')
# Temporarily switching to a maintained fork
# url="https://github.com/vacaboja/tg"
url="https://github.com/xyzzy42/tg"
license=('GPL2')
depends=('gtk3' 'portaudio' 'fftw')
provides=('tg-timer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xyzzy42/tg/archive/v0.6.0-tpiepho.tar.gz")
sha256sums=('f904a995e5d3ba3c61fcbab5603a8a9565c6b8e9efd14130e06e5854dd8adf06')

build() {
    cd "${pkgname}-${pkgver}-tpiepho"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}-tpiepho"
    make DESTDIR="${pkgdir}" install
}
