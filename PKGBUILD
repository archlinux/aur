# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apprise'
_name=${pkgname#python-}
pkgver=0.9.8.1
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
sha256sums=('78b9ff0110c52f09857dedd610be09f66052e8ec129250c2dba7684f1e57f095')

package() {
  cd apprise-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
