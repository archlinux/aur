# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-azure-cosmos
pkgver=4.16.1
pkgrel=1
pkgdesc="Azure Cosmos DB SDK for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' )
depends=('python-azure-core' 'python-typing_extensions' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/azure-cosmos/azure_cosmos-4.16.1.tar.gz")
sha256sums=('fa15d13702b470265a67e2dd9c0794021e6b776856dac6c223dcacc4d8e1d8d1')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
