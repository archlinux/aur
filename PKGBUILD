# Maintainer: Stefan Majewsky <majewsky@gmx.net>
pkgname=mpv-mpris
pkgver=0.4
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
sha256sums=('da7e1f9080ffc91ff9257c0d5efaa3c64d80ed1c7983da22392898bb9336515d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0644 mpris.so "${pkgdir}/usr/lib/mpv/mpris.so"
}
