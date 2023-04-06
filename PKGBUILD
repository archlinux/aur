# Maintainer: entshuld <edgar _ no _ openmail [d] cc>

pkgname=python-pyxel-fedic
_base=pyxel
pkgver=3.0.3.ga211380
pkgrel=1
pkgdesc="Python FE-DIC library"
arch=('any')
url="https://github.com/jcpassieux/pyxel"
license=('CeCILL')
depends=("python-numpy" "python-scipy" "python-matplotlib" "python-opencv" "python-scikit-image" "python-meshio" "gmsh")
optdepends=()
makedepends=('python-setuptools')
# provides=()
# conflicts=()
source=("git+https://github.com/jcpassieux/pyxel.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_base}"
  git describe --tags --match '*.*' | tr '-' '.' | sed 's-^v--'
}

build(){
  cd "${_base}"
  python setup.py build
}

package(){
  cd "${_base}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
