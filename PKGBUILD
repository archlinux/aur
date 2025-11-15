# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alois Nespor <alium@centrum.cz>
# Contributor: kikadf <kikadf.01@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: thacrazze <thacrazze|googlemail|com>

pkgname=clipgrab
pkgver=3.9.14
pkgrel=1
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ...'
arch=('x86_64')
url='https://clipgrab.org'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-webengine' 'yt-dlp')
optdepends=('ffmpeg: for the conversion functionality')
source=("https://download.clipgrab.org/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('d3e53731f9edaca05c5c860e15680ed2432dc5ad6c9a822acba5bc851f1ec836'
            '840910097d8c129ea12c395c4a33f562591e878e521c98fde8a7b3f9403aa23f')

build() {
    cd "${pkgname}-${pkgver}"
    qmake clipgrab.pro
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
