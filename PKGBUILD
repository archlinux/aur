# Maintainer: Daniel Wyatt <Daniel.Wyatt@gmail.com>
pkgname=seagate-leds-git
pkgver=r8.313166b
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/dewyatt/seagate-leds.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
        autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

