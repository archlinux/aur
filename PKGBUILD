# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pylzss
_pkgname=pylzss
pkgver=0.3.8
pkgrel=3
pkgdesc='A collection of common interactive command line user interfaces, based on Inquirer.js (fork of magmax/python-inquirer)'
arch=('x86_64')
url='https://github.com/m1stadev/pylzss'
license=('LGPL-3.0-only')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5be1221710ddf3174550881b66f25e90637f00256633c9cdba83e025e4e6ca8c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgname}-${pkgver}"
#   local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#   export PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}"
#   python test.py
# }

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
