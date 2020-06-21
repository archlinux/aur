# Maintainer: Luke Street <luke.street@encounterpc.com>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=vsts-cd-manager
pkgname=python-$_name
pkgver=1.0.2
pkgrel=3
pkgdesc="Microsoft Visual Studio Team Services Continuous Delivery Manager"
arch=('any')
url="https://github.com/Microsoft/$_name"
license=('MIT')
depends=('python-msrest' 'python-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('085ba16e70a0df2a228c00e70573d474ce5c565949c800f9fe0b77d4b0a1af52534099577f9f3bf6df7fea18297f53465222e62aa577d8e89f2b320ef2f63ec4')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
