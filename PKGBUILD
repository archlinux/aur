# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.21.1
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/mautrix/python/"
depends=('python' 'python-aiohttp' 'python-attrs' 'python-yarl')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('MPL')
arch=('any')
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"https://github.com/mautrix/python/archive/v${pkgver/_rc/-rc}.tar.gz")
sha256sums=('fb839804ae350869fdeb4f25f20e8ddc86521e60cf74a4965e53aae99c9186b2')

build() {
    cd python-${pkgver/_rc/-rc}
    python -m build --wheel --no-isolation
}

package() {
    cd python-${pkgver/_rc/-rc}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
