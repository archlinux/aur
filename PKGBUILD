# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-mgmt-core'
_name='azure_mgmt_core'
pkgver='1.4.0'
pkgrel=1
pkgdesc="Microsoft Azure Management Core Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-mgmt-core"
depends=(
    "python-azure-core>=1.26.2" "python-azure-core<2.0.0"
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('81071675f186a585555ef01816f2774d49c1c9024cb76e5720c3c0f6b337bb7d')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
