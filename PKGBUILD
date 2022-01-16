# Maintainer: Your Name <vitali64pmemail@protonmail.com>
pkgname=saurch-git
pkgver=r4.36a9cdb
pkgrel=1
pkgdesc=""
arch=('any')
url="http://vitali64.duckdns.org/?p=utils/saurch.git"
license=('GPL')
groups=()
depends=('python' 'git')
makedepends=()
provides=("${pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+http://vitali64.duckdns.org/git/utils/saurch.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#build() {
#	cd "$srcdir/${pkgname%-git}"
#	pip install build
#	python -m build
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	python3 setup.py install --root="${pkgdir}/" --optimize=1
}
