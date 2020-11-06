# Maintainer: Karmanyaah Malhotra <karmanyaahm@gmail.com>
pkgname=gotify-dunst-git
pkgver=r12.57d84061
pkgrel=1
pkgdesc="A simple script for receiving Gotify message notifications via dunst."
arch=('any')
url="https://github.com/ztpnk/gotify-dunst"
license=('GPL3')
depends=('python3' 'python-websocket-client' 'libnotify')
makedepends=('git')
source=("$pkgname::git+https://github.com/ztpnk/gotify-dunst")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
	cd "$srcdir/${pkgname%-VCS}"

	make DESTDIR="$pkgdir/" install

}
