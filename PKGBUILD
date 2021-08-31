# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=fiat
pkgname=python-${_base}-git
pkgdesc="Generation of arbitrary order Lagrange elements on lines, triangles, and tetrahedra."
pkgver=2019.1.0.70.g2f19f48
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/fiat"
license=('GPL3')
groups=('fenics-git')
depends=('python-numpy' 'python-sympy')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("fiat::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_base}"
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
 	cd fiat
 	python setup.py build
}

package() {
 	cd fiat
 	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
