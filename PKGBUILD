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
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('751d148fdf2bfa4779f05afa22673653b3475ab0418d4803162d2e4a3097f896')
backup=("etc/${pkgname}/styles.cfg")

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
