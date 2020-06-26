# Maintainer: Lasha Kanteladze <kanteladzelasha339@gmail.com>
pkgname=dxhd-git
pkgver=master
pkgrel=0
pkgdesc="An X11 Hotkey Daemon"
arch=('any')
url="https://github.com/dakyskye/dxhd"
depends=('util-linux')
makedepends=('make' 'git' 'go')
provides=('dxhd')
conflicts=('dxhd-bin')
source=("$pkgname::git+https://github.com/dakyskye/dxhd.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git rev-parse --short HEAD
}

build() {
	cd "$pkgname"
	make fast
}

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%????}/LICENSE"
	install -Dm755 dxhd "${pkgdir}/usr/bin/dxhd"
}
