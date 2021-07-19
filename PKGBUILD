# Maintainer: Florent Ch. <florentc@tutanota.com>
pkgname=xob
pkgver=0.3
pkgrel=1
pkgdesc="A lightweight volume (or anything) bar for the X Window System"
arch=('x86_64')
url="https://github.com/florentc/xob"
license=('GPL3')
depends=('libx11' 'libxrender' 'libconfig')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ab96717cff59cd0d3b42cbbc293cbd12f94d975584c47111717607779c155122')
backup=("etc/${pkgname}/styles.cfg")

build() {
	cd "$pkgname-$pkgver"
	make prefix="/usr" sysconfdir="/etc"
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="/usr" sysconfdir="/etc" DESTDIR="$pkgdir/" install
}
