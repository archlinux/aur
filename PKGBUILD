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
provides=('dxhd')
conflicts=('dxhd-bin')
source=("$pkgname::git+https://github.com/dakyskye/dxhd.git")
md5sums=('SKIP')


build() {
	cd "$pkgname"
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o $pkgname .
}

package() {
	cd "$pkgname"
	install -Dm755 $pkgname "$pkgdir"/usr/bin/dxhd
}
