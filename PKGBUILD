# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pydantic"
pkgname="python-${_name}"
pkgver=1.0
pkgrel=1
pkgdesc="Data validation using Python type hinting"
arch=("x86_64")
url="https://pydantic-docs.helpmanual.io/"
license=("MIT")
depends=("python")
makedepends=("cython")
optdepends=("python-ujson: faster JSON parsing in pure Python"
            "python-email-validation: enable email validation")
source=("https://github.com/samuelcolvin/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('3da938c2a626ee7b2e70c4f35bd922e28cb08e04be83385d19873ff125357810')

build() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
