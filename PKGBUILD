# Maintainer: Lasha Kanteladze <kanteladzelasha339@gmail.com>
pkgname=dxhd-git
pkgver=master
pkgrel=0
pkgdesc="An X11 Hotkey Daemon"
arch=('x86_64')
url="https://github.com/dakyskye/dxhd"
license=('MIT')
depends=('go')
makedepends=('git')
source=("$pkgname::git+https://github.com/dakyskye/dxhd.git")
md5sums=('SKIP')


build() {
	cd "$pkgname"
	CGO_ENABLED=0 go build -o $pkgname .
}

package() {
	cd "$pkgname"
	install -Dm755 $pkgname "$pkgdir"/usr/bin/dxhd
}
