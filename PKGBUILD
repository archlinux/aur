# Maintainer: Stefan Majewsky <majewsky@gmx.net>
pkgname=mpv-mpris
pkgver=0.7
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
sha256sums=('71bc5cc523ce364af06d7460afe573e90e453530af7f6855374b6b2c665d82e9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0644 mpris.so "${pkgdir}/usr/lib/mpv/mpris.so"
}
