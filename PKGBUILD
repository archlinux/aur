# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.20.7
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/mautrix/python/"
depends=('python' 'python-aiohttp' 'python-attrs' 'python-yarl')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('MPL')
arch=('any')
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"https://github.com/mautrix/python/archive/v${pkgver/_rc/-rc}.tar.gz")
sha256sums=('ee55a999e1bc1f60ea7aff26fd7687151de27c409180fad2d01ce1c0e401406b')

build() {
    cd python-${pkgver/_rc/-rc}
    python -m build --wheel --no-isolation
}

package() {
    cd python-${pkgver/_rc/-rc}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
