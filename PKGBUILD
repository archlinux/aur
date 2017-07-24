# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=aiohttp
pkgname=python-${_pkgname}-gns3
pkgver=2.2.0
pkgrel=1
pkgdesc='http client/server for asyncio (GNS3)'
arch=('any')
url="https://aiohttp.readthedocs.io/"
license=('Apache')
groups=('gns3')
depends=('python' 'python-yarl' 'python-chardet' 'python-multidict>=2.0' 'python-async-timeout>=1.1.0')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=("e50ea3d70f2d821b7e40442fb470e8ef")

prepare() {
    sed -i 's/yarl>=0.10.0,<0.11/yarl>=0.10.0,<=0.11/g' ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
