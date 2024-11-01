# shellcheck shell=bash
pkgname=rivercarro
pkgver=0.5.0
pkgrel=1
pkgdesc='A slightly modified version of rivertile layout generator for river.'
arch=('x86_64')
url='https://sr.ht/~novakane/rivercarro'
license=('GPL3')
depends=('wayland' 'wayland-protocols')
makedepends=('zig' 'git')
conflicts=('rivercarro-git')
source=("https://git.sr.ht/~novakane/$pkgname/refs/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('78643ae132a7dab9ca9904df0ca3eb3dc4d8b8873f3a407166fe95d958ec6b36')

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	DESTDIR="$pkgdir" zig build -Doptimize=ReleaseSafe --prefix '/usr'
}
