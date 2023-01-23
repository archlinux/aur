# Maintainer: Renato Lui Geh <renatogeh at gmail dot com> 

pkgname=python-pasp
_pypiname=${pkgname/python-/}
pkgver=0.0.2.post4
pkgrel=1
pkgdesc="Probabilistic answer set programming"
arch=("any")
url="https://RenatoGeh.github.io/pasp"
license=("MIT")
depends=("python" "clingo" "python-lark-parser" "python-numpy")
makedepends=("python-setuptools" "gcc" "python-numpy")
source=("https://files.pythonhosted.org/packages/12/52/03c5386c77276790a1485476ab5da5d4c32e72fc0c0e55cb03d431fa38dd/${_pypiname}-plp-${pkgver}.tar.gz")
sha256sums=("495221ba0e66f84ede1676db549b822b7b1c7ec0dbdf4cdaf7b9c88dceb8d7f0")

build() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
