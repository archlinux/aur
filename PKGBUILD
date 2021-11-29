# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=tessen
pkgver=1.2.3
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
            'pass-otp: to generate OTP'
            'xdg-utils: to open URLs in default web browser')
conflicts=('tessen-git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('53fb446d1f00b08ef3a08a90bc5c5031f4ecfdd198b3dda94bf16ba9e611351e')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
