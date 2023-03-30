# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=python-face
_name=${pkgname#python-}
_py=py3
pkgver=22.0.0
pkgrel=1
pkgdesc="Straightforward CLI parsing and dispatching microframework"
arch=('any')
url='https://github.com/mahmoud/face'
license=('BSD-3')
makedepends=('python-setuptools')
depends=('python-boltons')
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  'd5d692f90bc8f5987b636e47e36384b9bbda499aaf0a77aa0b0bbe834c76923d'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
