# Maintainer: Jonty Reid <aur@jont.au>
pkgname=trccd
pkgver=0.1.0
pkgrel=1
pkgdesc='lightweight daemon for controlling Thermalright LCD displays'
arch=('x86_64')
url="https://github.com/Jontos/$pkgname"
license=('GPL-3.0-or-later')
depends=('libusb' 'glibc' 'libgcc' 'ffmpeg')
backup=('etc/trccd/trccd.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bd51544a8a6071175e19a767bd4da5290d7e20e0c0009d605dc8ea5007ae95b')

build() {
    cd "$pkgname-$pkgver"
    make prefix=/usr sysconfdir=/etc
}

package() {
    cd "$pkgname-$pkgver"
    make prefix=/usr sysconfdir=/etc DESTDIR="$pkgdir" install
}
