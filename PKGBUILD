# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apprise'
_name=${pkgname#python-}
pkgver=0.9.6
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
arch=('any')
url="https://github.com/caronc/apprise"
license=('MIT')
depends=(
  'python-decorator'
  'python-requests'
  'python-requests-oauthlib'
  'python-oauthlib'
  'python-urllib3'
  'python-six'
  'python-click'
  'python-markdown'
  'python-yaml'
)

makedepends=(
  'python-setuptools'
  'python-babel'
  'python-pytest-runner'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('15ed06208197c9d28fd83cd69e727b48280879a4c611afd6b5aea5d0def397f8')

package() {
  cd apprise-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
