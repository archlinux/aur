# Maintainer: Jon Gjengset
pkgname=what-git
pkgver=r10.7ccdaed
pkgrel=2
pkgdesc="An improved version of w that shows all processes associated with a TTY"
arch=('any')
url="https://github.com/mit-pdos/what"
license=('MIT')
depends=('python')
makedepends=('git')
provides=()
conflicts=()
source=('git+https://github.com/mit-pdos/what.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D what "$pkgdir/usr/bin/what"
}
