# Maintainer: zhiayang <zhiayang@nowhere>

pkgname=wgman
pkgver=0.3.5
pkgrel=1
pkgdesc='Simple WireGuard wrapper-manager-thing'
url='https://github.com/zhiayang/wgman'
depends=('wireguard-tools')
makedepends=()
checkdepends=()
license=(Apache)
arch=('any')
_commit='345328ddf21afc32e1a626c6cb63422cf0672c16'
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
	install -Dm755 wgman.target "$pkgdir"/usr/lib/systemd/system/wgman.target
	install -Dm755 wgman@.service "$pkgdir"/usr/lib/systemd/system/wgman@.service
}
