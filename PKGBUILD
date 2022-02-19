# Maintainer: Philipp Hug <arch@hug.cx>
pkgname=chipsec-git
pkgver=1.8.1.r19.g90fc2bec
pkgrel=1
epoch=
pkgdesc="Platform Security Assessment Framework"
arch=("x86_64")
url="https://github.com/chipsec/chipsec"
license=('GPL2')
groups=()
depends=('python' 'chipsec-dkms' 'python-setuptools' 'make')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('chipsec')
conflicts=('chipsec')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/chipsec/chipsec")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/"
}
