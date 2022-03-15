# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
pkgname=gyrolock
pkgver=0.3
pkgrel=2
pkgdesc="GyrLock lock sessions when laptop move"
arch=('x86_64')
url="https://github.com/cyrinux/gyrolock"
license=('GPL')
makedepends=('go' 'make')
options=('!strip' '!emptydirs' '!lto')
depends=('systemd-lock-handler' 'swaylock')
source=("https://github.com/cyrinux/gyrolock/repository/v${pkgver}/archive.tar.gz")
source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
    "${pkgname}-${pkgver}-src.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz.asc")
validpgpkeys=('C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('1d206914d323938bb6b956646e97effd4693be05574ab72254e289abf217cfc9'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make release VERSION=v${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
