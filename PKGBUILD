# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=cockpit-pacman
pkgver=0.3.7
pkgrel=5
pkgdesc='Cockpit plugin for Arch Linux package management using alpm.rs'
arch=('x86_64')
url='https://github.com/pfeifferj/cockpit-pacman'
license=('GPL-3.0-or-later')
depends=('cockpit' 'gcc-libs' 'glibc' 'libalpm.so' 'pacman')
makedepends=('npm' 'rust' 'cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pfeifferj/cockpit-pacman/archive/v$pkgver.tar.gz")
sha256sums=('cd7bf2650749e5327cdf1c88be7db37359e9d368cef4bbde3172c02b1770e3f5')

build() {
    cd "$pkgname-$pkgver"
    make build
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
