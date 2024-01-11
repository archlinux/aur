# Maintainer: Sierra410 <(my nickname)@protonmail.com>

pkgname='noinputs-git'
pkgver=r5.42e64ed
pkgrel=1
pkgdesc="A simple script to disable (inhibit) input devices: a Wayland-compatible alternative to xinput."
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
}

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
