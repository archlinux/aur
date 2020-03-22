# Maintainer: Your Name <youremail@domain.com>
_name="syft-proto"
pkgname="python-"$_name"-git"
pkgdesc="PySyft protocol constants."
url="https://github.com/OpenMined/syft-proto"
pkgrel=1
arch=('any')
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("$_name::git+https://github.com/OpenMined/syft-proto.git")
sha512sums=('SKIP')

pkgver=r104.e6f5361
pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_name"
	python setup.py build
}

package() {
	cd "$srcdir/$_name"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
