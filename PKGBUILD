# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-common'
_name='azure_common'
pkgver='1.1.28'
pkgrel=1
pkgdesc="Microsoft Azure Client Library for Python (Common)"
url="https://github.com/Azure/azure-sdk-for-python"
depends=()

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=('5c12d3dcf4ec20599ca6b0d3e09e86e146353d443e7fcc050c9a19c1f9df20ad')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py2.py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
