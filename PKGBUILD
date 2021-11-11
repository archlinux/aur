# Maintainer: Kristian Setälä <kristian.setala@gmail.com>
pkgname=evdevremapkeys-git
pkgver=r49.9b6f372
pkgrel=2
pkgdesc="A daemon to remap key events on linux input devices."
arch=('any')
url="https://github.com/philipl/evdevremapkeys"
license=('MIT')
depends=()
makedepends=('git' 'python' 'python-virtualenv' 'patchelf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('git+https://github.com/philipl/evdevremapkeys')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./build-binary.sh
}

package() {
	install -D -m 755 "$srcdir/${pkgname%-git}/dist/evdevremapkeys" "$pkgdir/usr/bin/evdevremapkeys"
}
