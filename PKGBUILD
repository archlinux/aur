# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='estool'
pkgname="python-${_name}-git"
pkgver=r76.b095452
pkgrel=1
pkgdesc="Implementation of various Evolution Strategies, such as GA, PEPG, CMA-ES and OpenAI's ES using common interface"
provides=(python-${_name})
url="https://github.com/hardmaru/${_name}"
depends=('python-gym' 'python-pybullet' 'python-pycma' 
'python-mpi4py')
optdepends=('roboschool: roboschool gym environments')
makedepends=('python-setuptools')
license=('MIT')
arch=('x86_64')

pkgver() {
  cd "${srcdir}/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("git+${url}.git")
	
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


