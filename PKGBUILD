# Maintainer: Renato Lui Geh <renatogeh at gmail dot com> 

pkgname=python-pasp
_pypiname=${pkgname/python-/}
pkgver=0.0.1.post1
pkgrel=1
pkgdesc="Probabilistic answer set programming"
arch=("any")
url="https://RenatoGeh.github.io/pasp"
license=("MIT")
depends=("python" "clingo" "python-lark-parser")
makedepends=("python-setuptools" "gcc")
source=("https://files.pythonhosted.org/packages/91/c3/b24566312efeba98cf5f5f8521c4d9233645350706c01288700eb2dc9679/${_pypiname}-plp-${pkgver}.tar.gz")
sha256sums=("de8e9b0da88c5d5f30ccdc903470783df7a6a5244883db24412a5fed81bf8e51")

build() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
