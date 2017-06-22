# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=aiohttp
pkgname=python-${_pkgname}-gns3
pkgver=1.3.5
pkgrel=2
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
md5sums=("fac473aa71b5e49a6978b5bcc393a7ef")

prepare() {
    sed -i 's/yarl>=0.9.8,<0.10/yarl>=0.9.8,<0.11.0/g' ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
