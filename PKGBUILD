pkgname=luna-taskman-git
pkgver=1.0.0
pkgrel=1
pkgdesc="luna-taskman (git versiion)"
arch=('x86_64')
url="https://gitlab.com/materac-luna-project/luna-taskman"
license=('GPL-3.0-or-later')
depends=('glibc' 'curl' 'ncurses' 'readline' 'lua')
makedepends=('git' 'make')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cat $srcdir/luna-taskman/ver
}

build() {
	cd "$srcdir/luna-taskman"
	make build
}

package() {
	cd "$srcdir/luna-taskman"
	make ROOT="$pkgdir" SUDO_PREFIX="" install
}
