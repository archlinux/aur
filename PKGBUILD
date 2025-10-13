# Maintainer: lucas <lucas.bmior@gmail.com>

pkgname="clipsim-git"
pkgver=r708.a2a5840
pkgrel=1
pkgdesc="clipsim is a simple and fast X clipboard manager written in C."
arch=(x86_64)
url='https://github.com/lucas-mior/clipsim'
groups=()
license=(AGPL)
depends=(xclip libxfixes libxi)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./build.sh
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	./build.sh DESTDIR="$pkgdir/" PREFIX=/usr install
}
