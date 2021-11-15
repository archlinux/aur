# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=tessen
pkgver=1.2.2
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
sha256sums=('1a182cd7b856311d95a1ad099c753ca2fce2c2bf1cfcb22113c849ac2f476ad3')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
