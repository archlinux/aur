# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=tg
pkgver=0.5.2
pkgrel=1
pkgdesc="An advanced cross-platform solution for timing mechanical watches, a timegrapher. Also known as tg-timer."
arch=('x86_64')
# Temporarily switching to a maintained fork
# url="https://github.com/vacaboja/tg"
url="https://github.com/xyzzy42/tg"
license=('GPL2')
depends=('gtk3' 'portaudio' 'fftw')
provides=('tg-timer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xyzzy42/tg/archive/v0.5.2.tar.gz")
sha256sums=('41077edc0cdd262e70ade0f59ea31cfa7947fcd2e3bf02fe6694034ec4ec2f25')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
