# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-dijitso-git
pkgdesc="A Python module for distributed just-in-time shared library building"
pkgver=20190418
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/dijitso"
license=('GPL3')
groups=('fenics-git')
depends=('python-numpy')
makedepends=('git' 'python-setuptools')
optdepends=('mpi4py: for running tests with MPI')
options=(!emptydirs)
source=("dijitso::git+https://bitbucket.org/fenics-project/dijitso.git")
md5sums=('SKIP')

pkgver() {
	cd dijitso
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd dijitso
	python setup.py build
}

package() {
	cd dijitso
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
