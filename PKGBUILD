# Maintainer: Lucas Carvalho <zsinx6@users.noreply.github.com>

_name=musthe
pkgname="python-${_name}"
pkgver="1.0.0"
pkgrel=1
pkgdesc=" Music theory implemented in Python. Notes, intervals, scales and chords."
url="https://github.com/gciruelos/musthe"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("46825a7fcbf638e2617277c2ddfceac658e09fab9746e2bff17c9a548278f6ee")


build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
