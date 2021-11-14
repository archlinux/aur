# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=tessen
pkgver=1.2.1
pkgrel=1
pkgdesc="An interactive menu to autotype and copy password-store data"
arch=(x86_64)
url="https://github.com/ayushnix/tessen"
license=('GPL')
depends=('pass'
         'wtype'
         'wl-clipboard')
makedepends=('scdoc')
optdepends=('libnotify: to send notifications about copied data'
            'bemenu: wayland native dmenu backend'
            'rofi-lbonn-wayland-git: the wayland native fork of rofi'
            'wofi: unmaintained gtk based backend'
            'xdg-utils: to open URLs in default web browser')
conflicts=('tessen-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ayushnix/tessen/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('535f911d629d26738d3e298425cb2bb53f1ae7b8a7e833e8b845b2dba9eaac21')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
