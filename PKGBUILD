
# Maintainer: noTmeDev <notmedev28@gmail.com>
pkgname='termtree'
pkgver=2.3.2
pkgrel=2
pkgdesc="A file tree view"
arch=('x86_64')
url="https://github.com/bendikMichal/termtree"
license=('MIT')
depends=('glibc')
makedepends=('git' 'mingw-w64-gcc' 'make')
source=("git+https://github.com/bendikMichal/$pkgname")
md5sums=('SKIP')

# pkgver() {
#   cd "$pkgname"
#   git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
	cd "$pkgname"
	make
}

package() {
	install -Dm644 "${srcdir}/termtree/ttree.1" "${pkgdir}/usr/share/man/man1/ttree.1"
	install -Dm755 "${srcdir}/termtree/build/ttree" "${pkgdir}/usr/bin/ttree"
}

