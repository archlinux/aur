# Maintainer: Philipp Hug <arch@hug.cx>
pkgname=chipsec-git
pkgver=v1.2.5.r20.gc377a72
pkgrel=1
epoch=
pkgdesc="Platform Security Assessment Framework"
arch=("x86_64")
url="https://github.com/chipsec/chipsec"
license=('GPL2')
groups=()
depends=('python' 'python2')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
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
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	python2 setup.py build
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	python2 setup.py install --root="$pkgdir/"
}
