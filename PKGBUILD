# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-mgmt-datafactory'
_name='azure_mgmt_datafactory'
pkgver='3.1.0'
pkgrel=1
pkgdesc="Microsoft Azure Data Factory Management Client Library for Python"
url="https://github.com/Azure/azure-sdk-for-python"
depends=(
    'python-msrest>=0.7.0'
    'python-azure-common>=1.1' 'python-azure-common<=1.2'
    'python-azure-mgmt-core>=1.3.2' 'python-azure-mgmt-core<2.0.0'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('534463083aef82f6a0431a99321b645e071e2e1800cb1899a6a42fb1d7417166')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
