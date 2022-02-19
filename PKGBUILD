# Maintainer: Ayush Agarwal <ayushnix at fastmail dot com>

pkgname=tessen
pkgver=2.0.0
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
sha256sums=('a1259d3af46678ca3513cdb26d6caffe591d11d91bc4f45437a30fa09fb865b5')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
