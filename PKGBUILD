# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=cockpit-pacman
pkgver=0.3.5
pkgrel=2
pkgdesc='Cockpit plugin for Arch Linux package management using alpm.rs'
arch=('x86_64')
url='https://github.com/pfeifferj/cockpit-pacman'
license=('GPL-3.0-or-later')
depends=('cockpit' 'pacman')
makedepends=('npm' 'rust' 'cargo')
provides=('cockpit-pacman')
conflicts=('cockpit-pacman-git')
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pfeifferj/cockpit-pacman/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make build
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
