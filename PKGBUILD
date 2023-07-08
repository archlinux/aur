# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=tg
pkgver=0.6.1
pkgrel=1
pkgdesc="An advanced cross-platform solution for timing mechanical watches, a timegrapher. Also known as tg-timer."
arch=('x86_64')
# Temporarily switched to a maintained fork
# url="https://github.com/vacaboja/tg"
url="https://github.com/xyzzy42/tg"
license=('GPL2')
depends=('gtk3' 'portaudio' 'fftw')
provides=('tg-timer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xyzzy42/tg/archive/v${pkgver}-tpiepho.tar.gz")
sha256sums=('f5ad7b541a4e3c0493155025442ed1d5537480545fdc961a24372304fb61a2d5')

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
