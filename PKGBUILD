# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-azure-mgmt-rdbms
_pkg="${pkgname#python-}"
pkgver=10.1.0
pkgrel=1
pkgdesc='Microsoft Azure RDBMS Management Client Library for Python'
license=('MIT')
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
depends=(
    'python-msrest>=0.6.21'
    'python-azure-common>=1.1' 'python-azure-common<=1.2'
    'python-azure-mgmt-core>=1.3.1' 'python-azure-mgmt-core<2.0.0'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/py3/${_pkg::1}/$_pkg/${_pkg//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('8eac17d1341a91d7ed914435941ba917b5ef1568acabc3e65653603966a7cc88')

package() {
    python -m installer --destdir="$pkgdir" ${_pkg//-/_}-${pkgver}-py3-none-any.whl
    install -Dm0644 ${_pkg//-/_}-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}