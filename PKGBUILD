# Maintainer: Michael Koloberdin <michael@koloberdin.com>
pkgname=odcread-git
pkgver=0.2.r0.g6b9dd81
pkgrel=2
pkgdesc="Reader/converter for 'Oberon compound document' binary format used by the Black Box Component Builder"
arch=('x86_64')
url="https://github.com/ComdivByZero/${pkgname%-git}"
license=('GPL')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/ComdivByZero/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
