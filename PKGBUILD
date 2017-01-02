# Maintainer: Pavel Antonov <pvantonov@gmail.com>

pkgname=nuvola-app-google-play-music
pkgver=5.17
pkgrel=2
pkgdesc="Google Play integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-google-play-music"
license=('custom:BSD')
depends=('nuvolaplayer')
makedepends=('git' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('56f75c2c044980d46c92d6057ed2a846c8554a3a6474c84c957b3203740ee627')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -vCDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
