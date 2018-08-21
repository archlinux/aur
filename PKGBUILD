# Maintainer: Florent Ch. <florentc@tutanota.com>
pkgname=xob
pkgver=0.1
pkgrel=1
pkgdesc="A lightweight volume (or anything) bar for the X Window System"
arch=('x86_64')
url="https://github.com/florentc/xob"
license=('GPL3')
depends=('libx11' 'libconfig')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
