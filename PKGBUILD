# Maintainer: Vitali64 <vitali64pmemail@protonmail.com>
pkgname=saurch-git
pkgver=r4.36a9cdb
pkgrel=1
pkgdesc="Small AUR Command Helper"
arch=('any')
url="http://vitali64.duckdns.org/?p=utils/saurch.git"
license=('GPL')
depends=('python' 'git')
provides=("saurch")
source=('git+http://vitali64.duckdns.org/git/utils/saurch.git')
noextract=()
md5sums=('SKIP')

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
