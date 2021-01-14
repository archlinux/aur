# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-livestatus
pkgver=1.0.1
pkgrel=1
pkgdesc='Tiny waybar module to fetch new alerts from livestatus.'
arch=('x86_64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc')
makedepends=('go' 'make')
optdepends=(
    'dunst: to get popup notifications',
)
source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
    "${pkgname}-${pkgver}-src.tar.gz.asc::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3')
sha256sums=('7994b9cfdfe77b216df42e45c8bc304b60db2c80e3b891356bf84e10ceb473d1'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make VERSION=${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
