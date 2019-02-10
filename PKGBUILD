pkgname=python-lpsolve
pkgver=5.5
pkgrel=1
pkgdesc="lpsolve python extension for python 2.x and python 3.x"
license=('LGPL')
arch=('x86_64')
url="https://github.com/chandu-atina/lp_solve_python_3x"
depends=('lpsolve' 'python-numpy')
makedepends=('python-setuptools')
source=("git+https://github.com/chandu-atina/lp_solve_python_3x.git")
sha256sums=('SKIP')

prepare() {
  cd lp_solve_python_3x/extra/Python
}

build() {
  cd lp_solve_python_3x/extra/Python
  python ./setup.py build
}

package() {
  cd lp_solve_python_3x/extra/Python
  python ./setup.py install --root="${pkgdir}" --optimize=1
}
