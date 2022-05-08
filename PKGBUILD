# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=python-face
_name=${pkgname#python-}
_py=py3
pkgver=20.1.1
pkgrel=1
pkgdesc="Straightforward CLI parsing and dispatching microframework "
arch=('any')
url='https://github.com/mahmoud/face'
license=('BSD-3')
makedepends=('python-setuptools')
depends=('python-boltons')
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '7d59ca5ba341316e58cf72c6aff85cca2541cf5056c4af45cb63af9a814bed3e'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
