# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=tldr-lint
pkgver=0.0.15
pkgrel=1
pkgdesc="Validate tldr pages"
arch=(any)
url="https://github.com/tldr-pages/tldr-lint"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('2bb5dfaba58c612cfb0e9d22f1fe30333d1b3f8af74e0e3b417e7b8f5e7c8a75')

package() {
    npm install -g --prefix "${pkgdir}/usr" ${pkgname}-${pkgver}.tar.gz
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
