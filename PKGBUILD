# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=tldr-lint
pkgver=0.0.19
pkgrel=1
pkgdesc="Validate tldr pages"
arch=(any)
url="https://github.com/tldr-pages/tldr-lint"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('e78c2e8d874e5895c990e1867214e8f048567f6d97494570754ff35d638329f7')

package() {
    npm install -g --prefix "${pkgdir}/usr" ${pkgname}-${pkgver}.tar.gz
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
