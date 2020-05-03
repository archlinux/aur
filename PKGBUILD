# Maintainer: Stefan Majewsky <majewsky@gmx.net>
pkgname=mpv-mpris
pkgver=0.5
pkgrel=4
pkgdesc='MPRIS (Media Player Remote Interface Spec) plugin for mpv'
arch=('i686' 'x86_64')
url='https://github.com/hoyon/mpv-mpris'
license=('MIT')
depends=(
    'mpv'
    'glib2'
)
install=mpv-mpris.install
source=("https://github.com/hoyon/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('673aff031e7cc741edea68d7b4b0103d7b031d4a55755abb9e1be5dd4ec4e969')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0644 mpris.so "${pkgdir}/usr/lib/mpv/mpris.so"
}
