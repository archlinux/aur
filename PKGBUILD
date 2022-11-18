# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-azure-mgmt-resource
_pkg="${pkgname#python-}"
pkgver=21.2.1
pkgrel=1
pkgdesc='Microsoft Azure Resource Management Client Library for Python'
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
sha256sums=('c6f6987e6f61f0cb23abc3fb3658770bae8d299a46834d43d4b20251495d3806')

package() {
    python -m installer --destdir="$pkgdir" ${_pkg//-/_}-${pkgver}-py3-none-any.whl
    install -Dm0644 ${_pkg//-/_}-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}