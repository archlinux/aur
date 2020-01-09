# Maintainer: Stefan Majewsky <majewsky@gmx.net>
pkgname=mpv-mpris
pkgver=0.3
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
sha256sums=('7ce5af247c124a0ddbed223cf9df51a2302cddc60c7e7c648b5a8d6b419f59c6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0644 mpris.so "${pkgdir}/usr/lib/mpv/mpris.so"
}
