# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/vera-desktop/vera-plugin-tint2.git"
_gitbranch=master
_gitname=vera-plugin-tint2

pkgname="$_gitname-git"
pkgver=r7.a193926
pkgrel=1
pkgdesc="tint2 plugin for vera"
arch=(i686 x86_64)
url="https://github.com/vera-desktop/vera-plugin-tint2"
license=('LGPL')
groups=()
depends=('vera-git' 'tint2')
makedepends=('bake-sl')
provides=("${pkgname%}")
conflicts=("${pkgname%}" 'vera-plugin-tint2')
replaces=()
backup=()
options=()
install=vera-plugin-tint2.install
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	bake --configure install-directory="$pkgdir/"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	bake install
}
