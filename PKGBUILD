# Maintainer: Renato Lui Geh <renatogeh at gmail dot com> 

pkgname=python-pasp
_pypiname=${pkgname/python-/}
pkgver=0.0.3
pkgrel=1
pkgdesc="Probabilistic answer set programming"
arch=("any")
url="https://RenatoGeh.github.io/pasp"
license=("MIT")
depends=("python" "clingo" "python-lark-parser" "python-numpy" "python-numpy")
makedepends=("python-setuptools" "gcc" "python-numpy")
optdepends=("python-pytorch" "python-pytorch-cuda" "python-pytorch-opt" "python-pytorch-opt-cuda")
provides=("python-pasp")
conflicts=("python-pasp")
source=("https://files.pythonhosted.org/packages/db/33/8f58fdbce6a7097ca38e745139e86b661e41330db64f3b0646de71875255/${_pypiname}-plp-${pkgver}.tar.gz")
sha256sums=("375d26402e3efda928f20ea3ad3ea57bb993289c2c647e5a8aa90df4baad46ea")

build() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-plp-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
