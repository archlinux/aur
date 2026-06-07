# Maintainer: Timothy Flowers <t_chuck_flowers@yahoo.com>
pkgname=ellipsis-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r22.5f6c049
pkgrel=1
pkgdesc=""
arch=('any')
url=""
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
source=('ellipsis::git+https://github.com/chuck-flowers/ellipsis')
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr" install
}
