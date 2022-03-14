# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
pkgname=gyrolock
pkgver=0.1
pkgrel=1
pkgdesc="GyrLock lock sessions when laptop move"
arch=('x86_64')
url="https://github.com/cyrinux/gyrolock"
license=('GPL')
makedepends=('go' 'make')
options=('!strip' '!emptydirs' '!lto')
source=("https://github.com/cyrinux/gyrolock/repository/v${pkgver}/archive.tar.gz")
source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
    "${pkgname}-${pkgver}-src.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz.asc")
validpgpkeys=('C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('aa8e8b9a854ddfba2f0c72b58c11948d0f62f1ddf713576706c7c7125228f251'
    'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make release VERSION=v${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
