# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-unrar-cffi'
_pkgname=${pkgname#python-}
pkgver=0.2.2
pkgrel=5
pkgdesc='Exposes unrar library functionality through a zipfile-like interface.'
arch=('any')
url='https://github.com/davide-romanini/unrar-cffi'
license=('Apache')
depends=(
  'python-cffi'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-pytest'
  'python-pytest-runner'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9de6d907c0728724be07acfcb479eadf2692f1039ca7cf2df268abb5dfaf4b5d')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
