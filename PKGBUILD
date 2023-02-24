# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apprise'
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
arch=('any')
url="https://github.com/caronc/apprise"
license=('MIT')
depends=(
  'python-certifi'
  'python-dataclasses'
  'python-requests'
  'python-requests-oauthlib'
  'python-click'
  'python-markdown'
  'python-yaml'
)

makedepends=(
  'python-setuptools'
  'python-babel'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2c50c19a5dd41317b1f659c52b21a990febe6c15e08464228a1ce8e6098f11bf')

package() {
  cd apprise-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
