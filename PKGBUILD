# Maintainer: Jeidnx <jeidnx@domainhier.de>

pkgname=coshr-git
pkgver=r9.f098279
pkgrel=1
pkgdesc="Easily share the output of your commands"
arch=("any")
url="https://github.com/Jeidnx/coshr"
license=('GPL')
depends=('wl-clipboard' 'bash' 'curl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Jeidnx/coshr')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
