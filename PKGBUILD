# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=gnome-shell-screenshot-dbus-emulator
pkgver=0.1.0
pkgrel=1
pkgdesc='Gnome Shell Screenshot DBus Emulation.'
arch=('x86_64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc')
makedepends=('go' 'make')
source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
    "${pkgname}-${pkgver}-src.tar.gz.asc::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3')
sha256sums=('891f336d7cd6c2a038da683cf453bca835584ef9a265d641a7cc2e8af98c90bf'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make release VERSION=${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
