# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=gnome-shell-screenshot-dbus-emulator
pkgver=0.1.1
pkgrel=1
pkgdesc='Gnome Shell Screenshot DBus Emulation.'
arch=('x86_64')
url="https://github.com/cyrinux/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go' 'make' 'git')
source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
    "${pkgname}-${pkgver}-src.tar.gz.asc::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3')
sha256sums=('698c277b1134b71e97d2114049c38041a08271d99518aa0fb137fb91b2fec551'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make release VERSION=${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
