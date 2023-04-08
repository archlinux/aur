# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=envs
pkgname=python-envs
pkgver=1.4
pkgrel=1
pkgdesc='Easy access of environment variables from Python.'
url='https://pypi.org/project/envs'
arch=('any')
license=('Apache')
depends=('python-click' 'python-jinja' 'python-terminaltables')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock' 'python-pytest-timeout')
_tag=3bfd12ee46c4da92d0cdf68a183531ffdeb5ea73
source=(${_pkgname}::"git+https://github.com/capless/envs.git#tag=${_tag}")
sha256sums=('SKIP')

build() {
  cd ${_pkgname}
  python setup.py build
}

check() {
  cd ${_pkgname}
  python setup.py test
}

package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
