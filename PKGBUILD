# Maintainer: Andrew Stubbs <andrew.stubbs at gmail dot com>

pkgname=nuvola-app-youtube
pkgver=1.2
pkgrel=1
pkgdesc="Integration of YouTube into your linux desktop via Nuvola Player."
arch=('any')
url="https://github.com/tiliado/nuvola-app-youtube"
license=('2-Clause BSD-license')
depends=('nuvolaplayer>=3', 'nuvolaplayer<4')
makedepends=('git')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/nuvola-app-youtube/archive/${pkgver}.tar.gz")
md5sums=('f08dbeed43f3f45dce6e709b3411aae8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps/"
}

# vim:set ts=4 sw=4 et:
