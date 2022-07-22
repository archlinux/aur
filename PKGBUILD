# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-livestatus
pkgver=1.1.3
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
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('3791c285689a52d33624dea9d99475b32da3f55c425a8f01f8694e5ab15826cd'
    'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make release VERSION=${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
