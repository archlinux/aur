# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=tg
pkgver=0.7.0
pkgrel=1
pkgdesc="An advanced cross-platform solution for timing mechanical watches, a timegrapher. Also known as tg-timer."
arch=('x86_64')
# Temporarily switched to a maintained fork
# url="https://github.com/vacaboja/tg"
url="https://github.com/xyzzy42/tg"
license=('GPL2')
# Building without python-libtfr for now
depends=('gtk3' 'portaudio' 'fftw' 'python' 'python-matplotlib' 'python-scipy')
provides=('tg-timer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xyzzy42/tg/archive/v${pkgver}-tpiepho.tar.gz")
sha256sums=('a79bcf30c44f4f188504e58219fa3ac00461113cd8fb2b5b8ab3079a7a915384')

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
