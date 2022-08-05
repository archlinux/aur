# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-core'
_name='azure_core'
pkgver='1.24.2'
pkgrel=1
pkgdesc="Microsoft Azure Core Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-core"
depends=(
    'python-requests>=2.18.4'
    'python-six>=1.11.0'
    'python-typing_extensions>=4.0.1'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('a76856fa83efe1925a4fd917dc179c7daa15917dd71da2774833fa82a96f3dfa')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
