# Maintainer: Wilson Birney <wpbirney@gmail.com>
pkgname=pirate-get-git
pkgver=r244.34e3c66
pkgrel=1
pkgdesc="a command line interface for thepiratebay"
arch=('any')
url=""
license=('AGPL')
groups=()
depends=()
makedepends=('git' 'python') 
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/vikstrous/pirate-get.git')
noextract=()
md5sums=('SKIP')

gitname='pirate-get'

pkgver() {
	cd "$srcdir/$gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$gitname"
	python setup.py build
}

package() {
	cd "$srcdir/$gitname"
	python setup.py install --root $pkgdir
}
