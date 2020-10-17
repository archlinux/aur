# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-fiat-git
pkgdesc="Generation of arbitrary order Lagrange elements on lines, triangles, and tetrahedra."
pkgver=20200113
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/fiat"
license=('GPL3')
groups=('fenics-git')
depends=('python-numpy' 'python-sympy')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("fiat::git+https://bitbucket.org/fenics-project/fiat.git")
md5sums=('SKIP')

pkgver() {
 	cd fiat
 	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
 	cd fiat
 	python setup.py build
}

package() {
 	cd fiat
 	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
