# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-unrar-cffi'
_name=${pkgname#python-}
pkgver=0.1.0
_subver="a5"
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
arch=('any')
url="https://github.com/davide-romanini/unrar-cffi"
license=('MIT')
depends=(
  'python-twine'
)
makedepends=(
  'python-setuptools'
  'python-pytest'
)
# https://files.pythonhosted.org/packages/source/u/unrar-cffi/unrar-cffi-0.1.0.tar.gz
# https://files.pythonhosted.org/packages/32/6b/5f6cffd8e30304d160933342214c097bb7dca9d52bd6cf14a1678b2ea0b9/unrar-cffi-0.1.0a5.tar.gz
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}${_subver}.tar.gz")
sha256sums=('d12d89ad1e1e1ee73ea7f26351fbaab5e65f23375612a2521453e8dd32511df7')

package() {
  cd unrar-cffi-${pkgver}${_subver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
