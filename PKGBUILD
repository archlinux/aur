# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>
# Maintainer: Sving1024 <sving1024@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

_name=standardwebhooks
pkgname=python-${_name}
pkgver=1.0.1
pkgrel=3
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
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz"
)
sha256sums=('b557bb2e4b16ada179a517ec0fe6cbec5acf976c5619922bf29c457f89a451bd')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    cd ..
}
