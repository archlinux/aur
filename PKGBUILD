# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-mgmt-subscription'
_name='azure_mgmt_subscription'
pkgver='3.1.1'
pkgrel=1
pkgdesc="Microsoft Azure Subscription Management Client Library for Python"
url="https://github.com/Azure/azure-sdk-for-python"
depends=(
    'python-msrest>=0.7.1'
    'python-azure-common>=1.1' 'python-azure-common<=1.2'
    'python-azure-mgmt-core>=1.3.2' 'python-azure-mgmt-core<2.0.0'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('38d4574a8d47fa17e3587d756e296cb63b82ad8fb21cd8543bcee443a502bf48')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
