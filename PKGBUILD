# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-identity'
_name='azure_identity'
pkgver='1.13.0'
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

makedepends=('python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('bd700cebb80cd9862098587c29d8677e819beca33c62568ced6d5a8e5e332b82')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
