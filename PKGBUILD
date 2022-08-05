# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-storage-blob'
_name='azure_storage_blob'
pkgver='12.13.0'
pkgrel=1
pkgdesc="Microsoft Azure Blob Storage Client Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-blob"
depends=(
    "python-azure-core>=1.23.1" "python-azure-core<2.0.0"
    "python-msrest>=0.6.21"
    "python-cryptography>=2.1.4"
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('280a6ab032845bab9627582bee78a50497ca2f14772929b5c5ee8b4605af0cb3')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
