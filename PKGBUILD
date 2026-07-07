# Maintainer: Christian Pfeiffer <cpfeiffer@rev-crew.info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash
pkgname='mogui'
pkgver=0.2.2
pkgrel=1
pkgdesc="Python package for querying Source and GoldSource servers"
arch=('any')
url="https://github.com/cea-hpc/mogui"
license=('GPL-2.0-or-later AND CC-BY-SA-3.0')
depends=('environment-modules' 'python' 'python-pyqt5')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
_name='modules-gui'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('9b0b1a5aecff5db30e214d0e193cb2db6f35f89c672adf0267d00f9967512cc1')

build() {
  cd "$srcdir/${_name}-${pkgver}"

  python -m build --wheel --no-isolation --sdist
}

package() {
  cd "$srcdir/${_name}-${pkgver}"

  python -m installer --destdir "$pkgdir" dist/*.whl
}
