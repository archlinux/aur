pkgname=ssh-dashboard-git
pkgver=r20b4e3c
pkgrel=1
pkgdesc="A simple SSH dashboard"
arch=('x86_64')
url="https://github.com/AlpinDale/ssh-dashboard"
license=('MIT')
depends=('openssh')
makedepends=('git' 'go')
source=("git+https://github.com/AlpinDale/ssh-dashboard.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/ssh-dashboard"
	echo "r$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/ssh-dashboard"
	make
}

package() {
	cd "$srcdir/ssh-dashboard"
	make DESTDIR="$pkgdir" install
}
