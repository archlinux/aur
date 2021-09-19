# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apprise'
_name=${pkgname#python-}
pkgver=0.9.5.1
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
sha256sums=('bf090703aeb12b82c685d6b3674a3ddfe712a46c2089308c9bc202f03e06d58d')

package() {
  cd apprise-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
