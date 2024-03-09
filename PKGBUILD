# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-identity'
_name='azure_identity'
pkgver='1.15.0'
pkgrel=2
pkgdesc="Microsoft Azure Identity Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/identity/azure-identity"
depends=(
    'python-azure-core>=1.23.0' 'python-azure-core<2.0.0'
    'python-cryptography>=2.5'
    'python-msal>=1.24.0' 'python-msal<2.0.0'
    'python-msal-extensions>=0.3.0' 'python-msal-extensions<2.0.0'
    'python-six>=1.12.0'
)

makedepends=('python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/a/azure-identity/azure-identity-${pkgver}.tar.gz")
sha256sums=('4c28fc246b7f9265610eb5261d65931183d019a23d4b0e99357facb2e6c227c8')

package(){
    cd azure-identity-$pkgver
    python setup.py install --root="$pkgdir"/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
