# Maintainer: Mark Wells (halfhorn) com dot gmail at mwellsa
pkgname="i3-wk-switch-git"
pkgver=VERSION
pkgrel=1
pkgdesc="Workspace switcher for i3 wm that emulates xmonad"
arch=('any')
url="https://github.com/tmfink/i3-wk-switch"
license=('MIT')
groups=()
depends=('i3ipc-python-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	mv "i3-wk-switch.py" "$pkgdir/usr/bin/i3-wk-switch"
}
