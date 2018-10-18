# Maintainer: James-Adam Renquinha Henri <jarhmander@gmail.com>
pkgname=splitpatch-git
pkgver=r27.fd2f58d
pkgrel=1
pkgdesc="A utility to split a diff patch into separate sections"
arch=(any)
url="http://www.clearchain.com/blog/posts/splitting-a-patch"
license=('GPL')
depends=('ruby')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjsc/splitpatch.git')
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
	make DESTDIR="$pkgdir/" install
}
