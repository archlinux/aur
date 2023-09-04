# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-core'
_name='azure_core'
pkgver='1.29.3'
pkgrel=1
pkgdesc="Microsoft Azure Core Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-core"
depends=(
    'python-aiohttp>=3.0.0'
    'python-requests>=2.18.4'
    'python-six>=1.11.0'
    'python-typing_extensions>=4.6.0'
)
optdepends=(
    'python-aiohttp>=3.0'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('f8b2910f92b66293d93bd00564924ad20ad48f4a1e150577cf18d1e7d4f9263c')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
