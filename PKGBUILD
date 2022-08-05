# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-identity'
_name='azure_identity'
pkgver='1.10.0'
pkgrel=2
pkgdesc="Microsoft Azure Identity Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/identity/azure-identity"
depends=(
    'python-azure-core>=1.11.0' 'python-azure-core<2.0.0'
    'python-cryptography>=2.5'
    'python-msal>=1.12.0' 'python-msal<2.0.0'
    'python-msal-extensions>=0.3.0' 'python-msal-extensions<2.0.0'
    'python-six>=1.12.0'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('b386f1ccbea6a48b9ab7e7f162adc456793c345193a7c1a713959562b08dcbbd')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
