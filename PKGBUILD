# Maintainer: Viktor Nagy <viktor.nagy1995@gmail.com>
pkgname='subtube-git'
pkgver=1
pkgrel=1
pkgdesc="youtube viewer made of mpv/youtube-dl and sxiv"
arch=('x86_64')
url="https://github.com/nagy135/subtube"
license=('MIT')
depends=('sxiv' 'mpv' 'youtube-dl' 'xob')
optdepends=('dunst: notification daemon')
makedepends=('git')
provides=("${pkgname%-git}")
source=('subtube::git://github.com/nagy135/subtube.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
