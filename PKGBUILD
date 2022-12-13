# Maintainer: jakob <grandchild@gmx.net>

pkgname=d11amp
pkgver=0.59
pkgrel=2
pkgdesc="Oldschool MP3 player (Winamp lookalike)"
arch=(x86_64)
depends=(gtk4 gdk-pixbuf2 mpg123 libzip portaudio)
license=(BSD)
url="https://dettus.net/d11amp/"
source=("https://dettus.net/d11amp/d11amp_0.59.tar.bz2")
sha256sums=('596fe28fd2a0898bfff00aa5b79457633e73e7526b866b698419c134049e9841')

build() {
    cd "${srcdir}/${pkgname}_${pkgver}/"
    make
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver}/"
    install -Dm755 d11amp "${pkgdir}/usr/bin/d11amp"
    gzip d11amp.1
    install -Dm644 d11amp.1.gz "${pkgdir}/usr/share/man/man1/d11amp.1.gz"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/d11amp/LICENSE.txt"
}
