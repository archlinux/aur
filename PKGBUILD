# Maintainer: Luke Street <luke.street@encounterpc.com>

_name=vsts-cd-manager
pkgname=python-$_name
pkgver=1.0.2
pkgrel=1
pkgdesc="Microsoft Visual Studio Team Services Continuous Delivery Manager"
arch=('any')
url="https://github.com/Microsoft/$_name"
license=('MIT')
depends=('python-msrest' 'python-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0bb09059cd553e1c206e92ef324cb0dcf92334846d646c44c684f6256b86447b')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
