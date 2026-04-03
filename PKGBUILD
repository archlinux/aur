# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>
# Maintainer: Sving1024 <sving1024@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

_name=svix
pkgname=python-${_name}
pkgver=1.90.0
pkgrel=2
pkgdesc="Svix webhooks API client and webhook verification library"
url="https://github.com/svix/svix-webhooks/tree/main/python"
license=('MIT')
arch=('any')
depends=('python')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz"
    LICENSE::https://github.com/svix/svix-webhooks/raw/refs/heads/main/LICENSE
)
sha256sums=('85c4bcd3145c392e148623b46e614b430463cfc2f008333fb3e50bb4a36ca443'
            '5962c28427cb0c49b4782932eeeb9dfd3fcd14002755a68155bd6bb306717ced')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    cd ..
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
