# Maintainer: desbma
pkgname=cyanrip
pkgver=0.9.0
pkgrel=1
pkgdesc='Fully featured CD ripping program'
arch=('x86_64')
url='https://github.com/cyanreg/cyanrip'
license=('GPL3')
depends=('curl' 'ffmpeg' 'libcdio-paranoia' 'libmusicbrainz5')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cyanreg/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('45c47ac316103f4d5b4dcb059352b33e700cbd0cfc48a77c655664666b4b7d7d537a2d5bc71e5806ea508aae1dbfec6365ff3946dc755c5ad955190b37ef62a4')

build() {
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}
