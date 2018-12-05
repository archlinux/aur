# Maintainer: Andrew Rabert <arabert@nullsum.net>
# Contributor: Flaviu Tamas <aur@flaviutamas.com>

pkgname=fswatch
pkgver=1.14.0
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Linux inotify, Microsoft Windows and a stat-based backend"
arch=("i686" "x86_64")
url="https://emcrisostomo.github.io/fswatch/"
license=('GPLv3')
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('44d5707adc0e46d901ba95a5dc35c5cc282bd6f331fcf9dbf9fad4af0ed5b29d')

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
