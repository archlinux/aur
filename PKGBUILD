# Maintainer: jakob <grandchild@gmx.net>

pkgname=d11amp
pkgver=0.59
pkgrel=1
pkgdesc="Oldschool MP3 player (Winamp lookalike)"
arch=(x86_64)
depends=(gtk4 gdk-pixbuf2 mpg123 libzip portaudio)
license=(BSD)
url="https://dettus.net/d11amp/"
source=("https://github.com/dettus/d11amp/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3d0f0dea274b848c26dab26f476e302f00b398cf4388f25d0e9cdb1b5cd9c17b')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/mark4/software/"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/mark4/software/"
    install -Dm755 d11amp "${pkgdir}/usr/bin/d11amp"
    gzip d11amp.1
    install -Dm644 d11amp.1.gz "${pkgdir}/usr/share/man/man1/d11amp.1.gz"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/d11amp/LICENSE.txt"
}
