# Maintainer:
# Contributor: Nagy Gabor <Gabor.V.Nagy@@gmail.com>

pkgname=alevt
pkgver=1.8.3
pkgrel=1
pkgdesc="X11 Teletext/Videotext browser"
arch=('x86_64')
url="https://gitlab.com/alevt/alevt"
license=('GPL-2.0-or-later')
depends=('glibc' 'libpng' 'libx11')
install=alevt.install
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2772ac34c2a88bd4432198926f52b2f690d259ddf46359c6a85189e90bc26e40')

build() {
    cd "${pkgname}-v${pkgver}"
    make
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
