# Maintainer: Kazel <address at domain dot tld>
pkgname=usbguard-qt
pkgver=0.8.1
pkgrel=1
pkgdesc="USBGuard Qt GUI"
arch=("x86_64")
url="https://gitlab.com/WheelchairArtist/usbguard-qt"
license=('GPL2')
replaces=('usbguard-applet-qt')
depends=("usbguard")
makedepends=("qt6-base")
source=($url/-/archive/$pkgver/usbguard-qt-$pkgver.tar.gz?path=src)
sha512sums=("SKIP")

prepare() {
    cd "${srcdir}/usbguard-qt-$pkgver-src/src"
    qmake6 -o Makefile usbguard-qt.pro

}

build() {
    cd "${srcdir}/usbguard-qt-$pkgver-src/src"
    make
}

package() {
    install -Dm 0755 -o root -g root "${srcdir}/usbguard-qt-$pkgver-src/src/$pkgname" "${pkgdir}/usr/bin/$pkgname"
    install -Dm 0644 -o root -g root "${srcdir}/usbguard-qt-$pkgver-src/src/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
