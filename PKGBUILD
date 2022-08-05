# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-mgmt-core'
_name='azure_mgmt_core'
pkgver='1.3.1'
pkgrel=1
pkgdesc="Microsoft Azure Management Core Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-mgmt-core"
depends=(
    "python-azure-core>=1.23.0" "python-azure-core<2.0.0"
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('9667b9d65f2b41fed854e9d3a56f293739d327bf0d4e16252d9e785a6f4fe581')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
