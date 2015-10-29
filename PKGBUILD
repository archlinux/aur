# Maintainer: Florian Albertz <flo.albertz@gmail.com>
pkgname="aci-discovery-git"
pkgver=r11.b43b592
pkgrel=1
pkgdesc='Serve AppContainer Images and allow their discovery'
arch=('any')
url='https://github.com/coreos/aci-discovery'
license=('Apache')
makedepends=('go')
source=('git+https://github.com/coreos/aci-discovery.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"/aci-discovery
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd aci-discovery
	./build

	install -d "$pkgdir/opt/aci"
	install -Dm 755 bin/aci-discovery "$pkgdir/usr/bin/aci-discovery"
}
