# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-storage-blob'
_name='azure_storage_blob'
pkgver='12.17.0'
pkgrel=2
pkgdesc="Microsoft Azure Blob Storage Client Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-blob"
depends=(
    "python-azure-core>=1.28.0" "python-azure-core<2.0.0"
    "python-cryptography>=2.1.4"
    'python-isodate>=0.6.1'
)

makedepends=('python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('0016e0c549a80282d7b4920c03f2f4ba35c53e6e3c7dbcd2a4a8c8eb3882c1e7')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
