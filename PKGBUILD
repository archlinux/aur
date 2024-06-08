# Contributor: Stuart Mumford <stuart@cadair.com>

pkgname=python-drms
_name=drms
pkgver=0.7.1
pkgrel=1
pkgdesc="The drms module provides an easy-to-use interface for accessing HMI, AIA and MDI data with Python."
arch=(any)
url="https://github.com/sunpy/drms"
license=('BSD-2-Clause')
depends=('python-oldest-supported-numpy' 'python-six' 'python-pandas')
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=(${_name}-${pkgver}.tar.gz::https://github.com/sunpy/drms/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('3e83ca890abea825875812fe0e17455bc953bd127c73eef605cc22d08cc72f12')


build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
