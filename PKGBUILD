# Maintainer: Renato Lui Geh <renatogeh at gmail dot com> 

pkgname=python-pasp
_pypiname=${pkgname/python-/}
pkgver=0.0.2.post1
pkgrel=1
pkgdesc="Probabilistic answer set programming"
arch=("any")
url="https://RenatoGeh.github.io/pasp"
license=("MIT")
depends=("python" "clingo" "python-lark-parser")
makedepends=("python-setuptools" "gcc")
source=("https://files.pythonhosted.org/packages/73/ef/58045f8b4092feee16a97c4712c048d2ae1511dab0e55185abaf17d25ede/${_pypiname}-plp-${pkgver}.tar.gz")
sha256sums=("704877adb4db9b36b1ebe6e62702cadae599a9f88c05354661db5a423f66ad44")

build() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
