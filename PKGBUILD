# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=gnome-shell-screenshot-dbus-emulator
pkgver=0.1.2
pkgrel=3
pkgdesc='Gnome Shell Screenshot DBus Emulation.'
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go' 'make' 'git')
source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
    "${pkgname}-${pkgver}-src.tar.gz.asc::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3')
sha256sums=('e432deb88c59e2265d30165180441f58535dc2ebe509dd62489c8116991bacac'
    'SKIP')
options=(!lto)

build() {
    cd "${pkgname}-${pkgver}"
    make release VERSION=${pkgver}
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
