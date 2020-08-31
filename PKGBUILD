# Maintainer: aspen <luxx4x@protonmail.com>

pkgname="tapi-git"
pkgver=r38.86f43cdb6
pkgrel=1
arch=('any')
pkgdesc="Apple TAPI library"
url="https://github.com/tpoechtrager/apple-libtapi"
license=('LLVM')
depends=()
makedepends=('git' 'python' 'cmake')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	INSTALLPREFIX="$pkgdir/usr" ./build.sh
}

package() {
	cd "$pkgname"
	./install.sh
}
