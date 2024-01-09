# Maintainer: Sierra410 <(my nickname)@protonmail.com>
pkgname='noinputs-git'
pkgver=r2.828d447
pkgrel=1
pkgdesc="A simple script to temporary disable input devices: a Wayland-compatible alternative to xinput."
arch=('any')
url="https://gitlab.com/S410/noinputs"
license=('GPL-3-or-later')
depends=('python' 'python-evdev')
makedepends=('git')
source=('git+https://gitlab.com/S410/noinputs.git')
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 noinputs.py "$pkgdir/usr/bin/noinputs"
	install -Dm755 inhibit "$pkgdir/usr/lib/udev/inhibit"
}

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
