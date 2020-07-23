# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=xclickroot-git
pkgver=r3.309fd17
pkgrel=1
pkgdesc="Click on root window and run a command"
arch=(x86_64)
url="https://github.com/phillbush/xclickroot"
license=('Public Domain')
depends=('libx11')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

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
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
