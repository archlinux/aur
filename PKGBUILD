# Maintainer: zhiayang <zhiayang@nowhere>

pkgname=wgman
pkgver=0.3.2
pkgrel=2
pkgdesc='Simple WireGuard wrapper-manager-thing'
url='https://github.com/zhiayang/wgman'
depends=('wireguard-tools')
makedepends=()
checkdepends=()
license=(Apache)
arch=('any')
_commit='ee29b9fddb3f2d4cde26c1255b2e629286812b22'
source=("git+https://github.com/zhiayang/wgman.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd wgman
	make build
}

package() {
	cd wgman
	install -Dm755 build/wgman "$pkgdir"/usr/bin/wgman

	mkdir -p "$pkgdir"/etc/wgman/
	install -Dm755 wgman.target "$pkgdir"/usr/lib/systemd/system/
	install -Dm755 wgman@.service "$pkgdir"/usr/lib/systemd/system/
}
