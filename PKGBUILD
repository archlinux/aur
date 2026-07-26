# Maintainer: sandu <Halespider396>
pkgname=lazy-search
pkgver=1.0.0
pkgrel=1
pkgdesc="Fuzzy TUI search over official Arch repos and the AUR, part of the Lazy ecosystem"
arch=('x86_64')
url="https://github.com/Halespider396/lazy-search"
license=('MIT')
depends=('pacman' 'curl' 'tar' 'gzip')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Halespider396/lazy-search/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-main"
	make clean
	make
}

package() {
	cd "$srcdir/$pkgname-main"
	install -Dm755 "$startdir/lazy-search" "$pkgdir/usr/bin/lazy-search"
}
