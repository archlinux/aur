# Maintainer: Stefan Majewsky <majewsky@gmx.net>
pkgname='mpv-mpris'
pkgver=0.1
pkgrel=1
pkgdesc=''
arch=('i686' 'x86_64')
url='https://github.com/hoyon/mpv-mpris'
license=('MIT')
depends=(
    'mpv'
    'glib2'
)
install="${pkgname}.install"
source=("https://github.com/hoyon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('47afa6064fdd7552079d1574644bb1b16b782e96ed6aeebe24269e00b90a381b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0644 mpris.so "${pkgdir}/usr/lib/mpv/mpris.so"
}
