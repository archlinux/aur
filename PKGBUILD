# Maintainer: Florent Ch. <florentc@tutanota.com>
pkgname=xob
pkgver=0.2
pkgrel=1
pkgdesc="A lightweight volume (or anything) bar for the X Window System"
arch=('x86_64')
url="https://github.com/florentc/xob"
license=('GPL3')
depends=('libx11' 'libconfig')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('06fb0d9a081546b6b9d1785f6d6fa36f905516eec5df3a567b5d22bd1f8df33a')
backup=("etc/${pkgname}/styles.cfg")

build() {
	cd "$pkgname-$pkgver"
	make prefix="/usr" sysconfdir="/etc"
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="/usr" sysconfdir="/etc" DESTDIR="$pkgdir/" install
}
