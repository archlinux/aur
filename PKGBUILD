# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-ffc-git
pkgdesc="A compiler for finite element variational forms."
pkgver=20201007
pkgrel=1
arch=('any')
url="https://github.com/FEniCS/ffcx"
license=('GPL3')
groups=('fenics-git')
depends=('python-dijitso-git' 'python-fiat-git' 'python-ufl-git' 'pybind11')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("ffc::git+https://github.com/FEniCS/ffcx.git")
md5sums=('SKIP')

pkgver() {
	cd ffc
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ffc
	python setup.py build
}

package() {
	cd ffc
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
