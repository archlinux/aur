# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-core'
_name='azure_core'
pkgver='1.29.6'
pkgrel=1
pkgdesc="Microsoft Azure Core Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-core"
depends=(
    'python-anyio>=3.0.0' 'python-anyio<5.0.0'
    'python-requests>=2.18.4'
    'python-six>=1.11.0'
    'python-typing_extensions>=4.6.0'
)
optdepends=(
    'python-aiohttp>=3.0'
)

makedepends=(
    'python-installer'
)

makedepends=('python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('604a005bce6a49ba661bb7b2be84a9b169047e52fcfcd0a4e4770affab4178f7')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
