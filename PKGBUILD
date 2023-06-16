# Maintainer: Renato Lui Geh <renatogeh at gmail dot com> 

pkgname=python-pasp
_pypiname="${pkgname/python-/}-plp"
pkgver=0.0.4
pkgrel=1
pkgdesc="Probabilistic answer set programming"
arch=("any")
url="https://RenatoGeh.github.io/pasp"
license=("MIT")
depends=("python" "clingo" "python-lark-parser" "python-numpy" "python-numpy" "ncurses")
makedepends=("python-setuptools" "gcc" "python-numpy" "ncurses")
optdepends=("python-pytorch" "python-pytorch-cuda" "python-pytorch-opt" "python-pytorch-opt-cuda")
provides=("python-pasp")
conflicts=("python-pasp")
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=("dafabeb8bb9e9ba34203fda304b9d13655f371fd6c2b543a8823c8b35b1b3bc7")

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
