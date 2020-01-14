# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Hideaki Takahashi <mymelo+aur@gmail.com>
# Contributor: Vincent Demeester <vincent@sbr.pm>

pkgname=python2-docker-pycreds
pkgver=0.4.0
pkgrel=1
pkgdesc="Python bindings for the docker credentials store API"
arch=('any')
license=('Apache')
url="https://github.com/shin-/dockerpy-creds"
depends=('python2-six')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner' 'flake8' 'python2-pytest-cov')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shin-/dockerpy-creds/archive/${pkgver}.tar.gz")
sha512sums=('5c7c75a654693c6439592201bba6082af2962fab8d25af980ebb3ad2aede42973c31dbc2693eea1212f911980725bab257f973c7498b3555f68fae1630cfc62c')

build() {
  cd "${srcdir}"/dockerpy-creds-${pkgver}
  python2 setup.py build
}

check_disabled() {
  cd "${srcdir}"/dockerpy-creds-${pkgver}
  python2 setup.py pytest
}

package() {
  cd dockerpy-creds-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
