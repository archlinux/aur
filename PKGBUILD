# Maintainer: Luke Street <luke.street@encounterpc.com>

_name=vsts-cd-manager
pkgname=python-$_name
pkgver=1.0.1
pkgrel=1
pkgdesc="Microsoft Visual Studio Team Services Continuous Delivery Manager"
arch=('any')
url="https://github.com/Microsoft/$_name"
license=('MIT')
depends=('python-msrest' 'python-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a7e05a476a441d18122a3b66d4d6d6d3142f18dea75065edffc0b258cb2b0c9d')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
