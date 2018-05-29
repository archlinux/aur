# Maintainer: Jan Heczko <jan dot heczko at gmail dot com>
pkgname=python-pyipopt
pkgver=r126.36bcb7f
pkgrel=2
pkgdesc="A Python connector to IPOPT"
arch=('i686' 'x86_64')
url="https://github.com/xuy/pyipopt"
license=('BSD')
groups=()
depends=('coin-or-ipopt' 'python-numpy'	'gcc')
makedepends=('git')
optdepends=('python-algopy')
provides=('python-pyipopt')
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+http://github.com/xuy/pyipopt.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd pyipopt
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd pyipopt
	patch -Np1 -i "${SRCDEST}/pyipopt.patch"
}

build() {
	cd pyipopt
	python setup.py build
}

package() {
	cd pyipopt
	python setup.py install --root=$pkgdir
}
