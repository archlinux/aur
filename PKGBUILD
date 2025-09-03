# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=tldr-lint
pkgver=0.0.20
pkgrel=1
pkgdesc="Validate tldr pages"
arch=(any)
url="https://github.com/tldr-pages/tldr-lint"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('5c96655cea33f835a390964911c2c48f088237f1b66f070e6b1f817fe3a34861')

package() {
    npm install -g --prefix "${pkgdir}/usr" ${pkgname}-${pkgver}.tar.gz
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
