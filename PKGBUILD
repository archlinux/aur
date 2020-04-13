# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=xrandr-multihead-bottom-git
pkgver=r2.ee61e56
pkgrel=1
pkgdesc="Align a bunch of screens to the bottom edge left to right via a xrandr call."
arch=('x86_64' 'i686')
depends=('xorg-xrandr')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
url="https://github.com/hrehfeld/xrandr-multihead-bottom"
source=("git+${url}.git")
noextract=()
md5sums=("SKIP")
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git checkout master
}

package() {
    install -Dm755 "$srcdir/${pkgname%-git}/xrandr-multihead-bottom" "$pkgdir/usr/bin/xrandr-multihead-bottom"
}
