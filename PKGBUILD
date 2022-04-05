# Maintainer: xfnw <xfnw@riseup.net>

pkgname=justify-git
pkgver=r17.5ad543a
pkgrel=1
pkgdesc="Simple text alignment tool that supports left/right/center/fill justify alignment"
arch=('x86_64')
url="https://tildegit.org/jns/justify/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://tildegit.org/jns/justify.git')
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
	install -D "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
