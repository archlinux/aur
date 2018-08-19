# Maintainer: Stefan Majewsky <majewsky@gmx.net>
pkgname=mpv-mpris
pkgver=0.2
pkgrel=1
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
sha256sums=('d21a9617759bc368d6e9cb229d099b12968f0e673db5cd0bf12d8a251516d81a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0644 mpris.so "${pkgdir}/usr/lib/mpv/mpris.so"
}
