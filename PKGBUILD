# Maintainer: Ayush Agarwal <ayushnix at fastmail dot com>

pkgname=tessen
pkgver=2.1.1
pkgrel=1
pkgdesc="An interactive menu to autotype and copy password-store and gopass data"
arch=(any)
url="https://github.com/ayushnix/tessen"
license=('GPL')
makedepends=('scdoc')
optdepends=(
            'pass: supported pass backend'
            'gopass: supported pass backend'
            'wtype: to autotype data'
            'wl-clipboard: to copy data'
            'libnotify: to send notifications about copied data'
            'rofi-lbonn-wayland-git: the wayland native fork of rofi'
            'fuzzel: wayland native dmenu backend'
            'bemenu: wayland native dmenu backend'
            'wofi: unmaintained gtk based backend'
            'pass-otp: to generate OTP'
            'xdg-utils: to open URLs in default web browser')
conflicts=('tessen-git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('14c38fdf3b562b686e0a117dd32a1288e21d9e37cf4c2e5b96ea2720e65ff9bc')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
