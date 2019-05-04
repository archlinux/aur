# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pydantic"
pkgname="python-${_name}"
pkgver=0.24
pkgrel=2
pkgdesc="Data validation using Python type hinting"
arch=("any")
url="https://pydantic-docs.helpmanual.io/"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/samuelcolvin/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('4f60796176496faa947c8f5ffca2cc627034cdd7af935cc03e67d89ca6202e7c')

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}"-"${pkgver}"

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
