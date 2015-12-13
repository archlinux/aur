# Maintainer: Florian Albertz <flo.albertz@gmail.com>
pkgname="actool-git"
pkgver=r798.bf62629
pkgrel=1
pkgdesc='Build AppContainer Images'
arch=('any')
url='https://github.com/appc/spec'
license=('Apache')
makedepends=('go')
source=('git+https://github.com/appc/spec')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"/spec
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd spec
	./build

	install -Dm 755 bin/actool "$pkgdir/usr/bin/actool"
}
