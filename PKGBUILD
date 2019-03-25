# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=intel-power-control-git
pkgver=r14.5b53221
pkgrel=1
pkgdesc="GPU power management for Intel hardware on Linux"
url="https://github.com/jmechnich/intel-power-control"
arch=('x86_64')
license=('unknown')
groups=()
depends=(python-pyqt5)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jmechnich/intel-power-control')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr/" install
}
