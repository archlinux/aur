# Maintainer: desbma
pkgname=cyanrip
pkgver=0.7.0
pkgrel=1
pkgdesc='Fully featured CD ripping program'
arch=('x86_64')
url='https://github.com/cyanreg/cyanrip'
license=('GPL3')
depends=('curl' 'ffmpeg' 'libcdio-paranoia' 'libmusicbrainz5')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cyanreg/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4d86a6637e216fceeb1cb44e4640d8b4f0c93320e5ca06d51be27e3f6b5c9c6502d5c95074d181b244c6f8b0bbdff195de31e02d68eb3fcd5cbf0a84c1a57ba2')

build() {
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}
