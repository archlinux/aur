# Maintainer: Pavel Khromov <pakhromov@gmail.com>
pkgname=clip-bridge
pkgver=0.1
pkgrel=1
pkgdesc="Wayland clipboard persistence, history forwarding to an external manager like cliphist, and copy/paste helpers for scripting"
arch=('x86_64')
url="https://github.com/pakhromov/clip-bridge"
license=('MIT')
depends=('glibc' 'wayland')
optdepends=('cliphist: clipboard history backend (default command)'
            'clipvault: alternative clipboard history backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70cafd7cb265f643e383efb2c02b9e0a8e41673130b46033b8055628cd85ffd6')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
