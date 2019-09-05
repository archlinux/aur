# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pydantic"
pkgname="python-${_name}"
pkgver=0.32.2
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
sha256sums=('734d84a2c141d454e6d350ede78b8da9cc4cdc84bf5f7a8dd066ebb899cd0480')

build() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
