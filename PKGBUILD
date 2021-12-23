# Maintainer: Michael Koloberdin <michael@koloberdin.com>
pkgname=odcread-git
pkgver=r53.20af5cf
pkgrel=1
pkgdesc="Reader/converter for 'Oberon compound document' binary format used by the Black Box Component Builder"
arch=('x86_64')
url="https://github.com/gertvv/${pkgname%-git}"
license=('GPL')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/gertvv/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CFLAGS="-O2 -Wall"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 odcread "$pkgdir/usr/bin/odcread"
}
