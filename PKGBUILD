# Maintainer: Ayush Agarwal <ayushnix at fastmail dot com>

pkgname=tessen
pkgver=2.1.3
pkgrel=1
pkgdesc="An interactive menu to autotype and copy password-store and gopass data"
arch=(any)
url="https://sr.ht/~ayushnix/tessen/"
_url="https://git.sr.ht/~ayushnix/tessen"
license=('GPL')
makedepends=('scdoc')
optdepends=(
            'pass: supported pass backend'
            'gopass: supported pass backend'
            'wtype: to autotype data'
            'wl-clipboard: to copy data'
            'libnotify: to send notifications about copied data'
            'fuzzel: wayland native dmenu backend'
            'tofi: wayland native dmenu backend'
            'bemenu: wayland native dmenu backend'
            'wofi: unmaintained gtk based backend'
            'rofi-lbonn-wayland-git: the wayland native fork of rofi'
            'pass-otp: to generate OTP'
            'xdg-utils: to open URLs in default web browser')
conflicts=('tessen-git')
source=("$_url/refs/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('04ac54ba51b687ce69834597411bee52081b044d855dbdb1d61eabbbd7524d79')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
