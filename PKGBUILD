# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.20.6
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/mautrix/python/"
depends=('python' 'python-aiohttp' 'python-attrs' 'python-yarl')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('MPL')
arch=('any')
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"https://github.com/mautrix/python/archive/v${pkgver/_rc/-rc}.tar.gz")
sha256sums=('62628e808c03bbf8f6956d07dceba033961f702a02ec14e74c2bd68e68c0a0a0')

build() {
    cd python-${pkgver/_rc/-rc}
    python -m build --wheel --no-isolation
}

package() {
    cd python-${pkgver/_rc/-rc}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
