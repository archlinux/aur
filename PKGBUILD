# Contributor: Filippo Ranza <filipporanza@gmail.com>
# Contributor: tee < teeaur at duck dot com >
pkgname=bfi
pkgver=0.3
pkgrel=3
pkgdesc="Brainfuck interpreter with interactive shell"
arch=(x86_64)
url="https://github.com/FilippoRanza/bfi"
makedepends=(git)
license=(GPL-3.0-or-later)
makedepends=('cmake')
depends=('glibc' 'readline')
source=("git+$url")
b2sums=('SKIP')

build() {
	cd "$pkgname"
	cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
