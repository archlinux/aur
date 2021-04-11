# Maintainer: castillo055
pkgname=program-shell-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r6.55cd858
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/castillo055/program-shell/"
license=('unknown')
groups=()
depends=()
makedepends=('git'
            'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=()
options=()
install=
source=('git+https://github.com/castillo055/program-shell#branch=main')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake .
	cmake --build . --target program_shell
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cmake --install . --target program_shell --prefix "$pkgdir/usr/"
}
