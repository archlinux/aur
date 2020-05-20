# Maintainer: Alexander Goussas <alexander@alexandergoussas.com>
pkgname=qobra-git
pkgver=1.3.0r24.d08f4fb
pkgrel=1
pkgdesc="A simple music player for the command line."
arch=('x86_64')
url="https://www.github.com/aloussase/qobra"
license=('GPL3')
groups=()
depends=(mpg123)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "1.3.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
