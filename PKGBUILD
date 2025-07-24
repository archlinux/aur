# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=python-face
_name=${pkgname#python-}
_py=py3
pkgver=24.0.0
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
  '611e29a01ac5970f0077f9c577e746d48c082588b411b33a0dd55c4d872949f6'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
