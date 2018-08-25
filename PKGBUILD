# Maintainer: Florent Ch. <florentc@tutanota.com>
pkgname=xob
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight volume (or anything) bar for the X Window System"
arch=('x86_64')
url="https://github.com/florentc/xob"
license=('GPL3')
depends=('libx11' 'libconfig')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('78e06280504ff21213bc947c97fb0604c42addc0d8dc4a18c239bfd8f0aa1614')
backup=("etc/${pkgname}/styles.cfg")

build() {
	cd "$pkgname-$pkgver"
	make prefix="/usr" sysconfdir="/etc"
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="/usr" sysconfdir="/etc" DESTDIR="$pkgdir/" install
}
