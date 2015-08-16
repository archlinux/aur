# Maintainer: Greygjhart <greg+devel@marvid.fr>
pkgname=rawide-git
pkgver=1.0
pkgrel=1
pkgdesc=""
arch=(any)
url="http://github.com/greygjhart/rawide"
license=('GPL')
groups=()
depends=(xdg-utils)
optdepends=('gettext: translation support')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/greygjhart/rawide')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	grep VERSION Makefile | cut -d= -f2
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
