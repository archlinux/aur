# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>
# Maintainer: Sving1024 <sving1024@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

_name=standardwebhooks
pkgname=python-${_name}
pkgver=1.1.0
pkgrel=2
pkgdesc="Python library for Standard Webhooks"
url="https://github.com/standard-webhooks/standard-webhooks/tree/main/libraries/python"
license=('MIT')
arch=('any')
depends=(
    'python' 
    'python-httpx'
    'python-deprecated'
    'python-attrs'
    'python-types-python-dateutil'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
    'python-hatchling'
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz"
)
sha256sums=('e5cb66e21a6356ebb9375aeb57f1348583323015808d475a7c1baaa4b718068a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    cd ..
}
