# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-ufl-git
pkgdesc="Unified form language."
pkgver=20210525
pkgrel=1
arch=('any')
url="https://github.com/FEniCS/ufl"
license=('GPL3')
groups=('fenics-git')
depends=('python-numpy')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("ufl::git+https://github.com/FEniCS/ufl.git")
md5sums=('SKIP')

pkgver() {
	cd ufl
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ufl
	python setup.py build
}

package() {
	cd ufl
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
