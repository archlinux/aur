# Maintainer: zhiayang <zhiayang@nowhere>

pkgname=wgman
pkgver=0.3.1
pkgrel=2
pkgdesc='Simple WireGuard wrapper-manager-thing'
url='https://github.com/zhiayang/wgman'
depends=('wireguard-tools')
makedepends=()
checkdepends=()
license=(Apache)
arch=('any')
_commit='f977713e9822ef57e0cdd1df4b1a9de89a40cbb3'
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
}
