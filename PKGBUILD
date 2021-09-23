# Maintainer: David "Sid" Olofsson <contact@sidju.se>
pkgname=gitgud-git
pkgver=r14.0655606
pkgrel=1
pkgdesc="Git Gud - a utility for when you are told to 'get good'"
arch=('any')
url="https://github.com/fsufitch/git-gud"
license=('Unlicense')
groups=()
depends=(
	'python-argparse'
	'python-pyfiglet'
	'git')
makedepends=('git'
	'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}")
install=
source=('git+https://github.com/fsufitch/git-gud.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/git-gud"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/git-gud"
	python setup.py build
}

package() {
	cd "$srcdir/git-gud"
	python setup.py install --root="$pkgdir" --optimize=1
}
