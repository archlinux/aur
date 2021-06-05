# Maintainer: Aditya Gupta <ag15035 at gmail dot com>
pkgname=graphmat-git
pkgver=r25.15a33a9
pkgrel=1
pkgdesc="A matrix header-only library, uses graphs internally"
arch=(x86_64)
url="https://github.com/adi-g15/graphMat"
license=('MIT')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/adi-g15/graphMat')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
