# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=lenovo-thinkpad-yoga-11e-chromebook-git
pkgver=r8.e0ad934
pkgrel=1
pkgdesc="Fixes for the Lenove Yoga Thinkpad 11e Chromebook"
arch=('any')
url="https://github.com/kcolford/lenovo-thinkpad-yoga-11e-chromebook"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+$url")
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/usr" install
}
