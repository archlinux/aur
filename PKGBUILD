# shellcheck shell=bash
pkgname=rivercarro
pkgver=0.4.0
pkgrel=1
pkgdesc='A slightly modified version of rivertile layout generator for river.'
arch=('x86_64')
url='https://sr.ht/~novakane/rivercarro'
license=('GPL3')
depends=('wayland' 'wayland-protocols')
makedepends=('zig' 'git')
conflicts=('rivercarro-git')
source=("https://git.sr.ht/~novakane/$pkgname/refs/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('f8750fe8485df0987fbff9114089f748c1ee7324b8f4f86f20db787433b9eb441274c3f8d877279ee5e41d4a131d71cb642b19e299098e508c46caa049655b35')

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	DESTDIR="$pkgdir" zig build -Doptimize=ReleaseSafe --prefix '/usr'
}
