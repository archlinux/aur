pkgname=python-aiohttp-asyncmdnsresolver
pkgver=0.2.0
pkgrel=1
pkgdesc='Async mDNS resolver for aiohttp'
arch=('any')
url='https://github.com/aio-libs/aiohttp-asyncmdnsresolver'
license=('Apache-2.0')
depends=('python' 'python-aiodns>=3.2.0' 'python-aiohttp>=3.10.0' 'python-zeroconf>=0.142.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/a/aiohttp-asyncmdnsresolver/aiohttp_asyncmdnsresolver-${pkgver}.tar.gz")
sha256sums=('aab2cef7ef8ae45b94abf1fc92aa9f4d70cbef7ac0a3d495a86fb96fce357262')

build() {
    cd "aiohttp_asyncmdnsresolver-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "aiohttp_asyncmdnsresolver-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
