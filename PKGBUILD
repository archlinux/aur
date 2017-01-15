# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgname=jautolock-git
pkgver=0.5.r1.19e3e05
pkgrel=1
pkgdesc="An automatic X screen-locker/screen-saver"
arch=('i686' 'x86_64')
url="https://github.com/johnchen902/jautolock"
license=('GPL3')
depends=('confuse' 'libxss')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/johnchen902/jautolock.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
