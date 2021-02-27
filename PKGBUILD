# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-livestatus
pkgver=1.1.1
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
sha256sums=('d4d575758774099f845c2dcdadb8ecd03d27ce60f55b0da98cfdbf1f80fc0beb'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make release VERSION=${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
