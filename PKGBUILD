# Maintainer: desbma
pkgname=cyanrip
pkgver=0.8.1
pkgrel=1
pkgdesc='Fully featured CD ripping program'
arch=('x86_64')
url='https://github.com/cyanreg/cyanrip'
license=('GPL3')
depends=('curl' 'ffmpeg' 'libcdio-paranoia' 'libmusicbrainz5')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cyanreg/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0c2e5027ef6fc0fbc5a3d648a818ab96b214291d28f0fb66b7bba6f7c688056f84725ff479ab4c36b1e2868aea365de8ab50edd3bc014ca27346ae358b5ca78e')

build() {
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}
