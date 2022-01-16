# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=tessen
pkgver=1.3.0
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
            'fuzzel: wayland native dmenu backend'
            'rofi-lbonn-wayland-git: the wayland native fork of rofi'
            'wofi: unmaintained gtk based backend'
            'pass-otp: to generate OTP'
            'xdg-utils: to open URLs in default web browser')
conflicts=('tessen-git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1a3cd2afc5297cc417e3f7383c08af0a911f72e005950fc940f9717c0a0156f5')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
