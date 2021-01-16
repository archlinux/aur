# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-livestatus
pkgver=1.0.2
pkgrel=1
pkgdesc='Tiny waybar module to fetch new alerts from livestatus.'
arch=('x86_64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome')
makedepends=('go' 'make')
optdepends=(
    'mako: to get popup notifications',
)
source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
    "${pkgname}-${pkgver}-src.tar.gz.asc::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3')
sha256sums=('33574c6203580d9348995e606c89189e40e407124b4811ff0d17d425ebab7fda'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make VERSION=${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
