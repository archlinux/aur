# Maintainer: Viktor Nagy <viktor.nagy1995@gmail.com>
pkgname='subtube-wayland-git'
pkgver=1
pkgrel=2
pkgdesc="youtube viewer made of mpv/youtube-dl and sxiv (for wayland)"
arch=('x86_64')
url="https://github.com/nagy135/subtube"
license=('MIT')
depends=('sxiv' 'mpv' 'youtube-dl' 'jq')
optdepends=('mako: notification daemon' 'wob: progress bar')
makedepends=('git')
provides=("${pkgname%-git}")
source=('subtube-wayland-git::git://github.com/nagy135/subtube.git#branch=wayland')

md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
