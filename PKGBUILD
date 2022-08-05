# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-msal-extensions'
_name='msal_extensions'
pkgver='1.0.0'
pkgrel=2
pkgdesc="Microsoft Authentication Extensions for Python"
url="https://github.com/AzureAD/microsoft-authentication-extensions-for-python"
depends=(
    'python-msal>=0.4.1)' 'python-msal<2.0.0'
    'python-portalocker>=1.0' 'python-portalocker<3'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=('91e3db9620b822d0ed2b4d1850056a0f133cba04455e62f11612e40f5502f2ee')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py2.py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
