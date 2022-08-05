# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-mgmt-datafactory'
_name='azure_mgmt_datafactory'
pkgver='2.7.0'
pkgrel=1
pkgdesc="Microsoft Azure Data Factory Management Client Library for Python"
url="https://github.com/Azure/azure-sdk-for-python"
depends=(
    'python-msrest>=0.6.21'
    'python-azure-common>=1.1' 'python-azure-common<=1.2'
    'python-azure-mgmt-core>=1.3.1' 'python-azure-mgmt-core<2.0.0'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('d7b58b25e9ad02253b4684a671be2c066b5f11fe05390bb3cdbbe73a24c115b9')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
