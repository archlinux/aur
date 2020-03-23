# Maintainer: Your Name <youremail@domain.com>
_name="syft"
pkgname="python-"$_name"-git"
pkgdesc="A library for encrypted, privacy preserving machine learning"
url="https://github.com/OpenMined/PySyft"
pkgrel=1
arch=('any')
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("$_name::git+https://github.com/OpenMined/PySyft.git")
sha512sums=('SKIP')

pkgver=r5672.5998f68e
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
