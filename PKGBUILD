# Maintainer: Andrew Rabert <ar@nullsum.net>
# Contributor: Flaviu Tamas <aur@flaviutamas.com>

pkgname=fswatch
pkgver=1.17.1
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Linux inotify, Microsoft Windows and a stat-based backend"
arch=("i686" "x86_64")
url="https://emcrisostomo.github.io/fswatch/"
license=('GPLv3')
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c38e341c567f5f16bfa64b72fc48bba5e93873d8572522e670e6f320bbc2122f')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
