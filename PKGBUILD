pkgname=rivercarro
pkgver=0.3.0
pkgrel=1
pkgdesc='A slightly modified version of rivertile layout generator for river.'
arch=('x86_64')
url='https://sr.ht/~novakane/rivercarro'
license=('GPL3')
depends=('wayland' 'wayland-protocols')
makedepends=('zig' 'git')
conflicts=('rivercarro-git')
source=("https://git.sr.ht/~novakane/$pkgname/refs/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('3bb092582f28d78c37f2c16bda5b54b6a21500628a7f06facb7f4d8d93a10ea3a71df6bfa64c689396bccd293e467f6422173e5e13db322e0a7a4e823e0b62a6')

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	DESTDIR="$pkgdir" zig build -Doptimize=ReleaseSafe --prefix '/usr'
}
