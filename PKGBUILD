# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=aiohttp
pkgname=python-${_pkgname}-gns3
pkgver=2.2.0
pkgrel=3
pkgdesc='http client/server for asyncio (GNS3)'
arch=('any')
url="https://aiohttp.readthedocs.io/"
license=('Apache')
groups=('gns3')
depends=('python' 'python-yarl' 'python-chardet' 'python-multidict-gns3' 'python-async-timeout-gns3')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('a504fc979f897ab776cbbb324443dd0aebd6ba832765fb54770ea2ecb2a6e07b')

prepare() {
    cd ${_pkgname}-${pkgver}
    sed -i 's/yarl>=0.10.0,<0.11/yarl>=0.10.0,<=0.11/g' setup.py
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
