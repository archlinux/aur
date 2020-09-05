pkgname=python-ciscoconfparse
_pkgname=ciscoconfparse
pkgver=1.5.0
pkgrel=1
pkgdesc="Parse, Audit, Query, Build, and Modify Cisco IOS-style configurations "
arch=('any')
url="http://www.pennington.net/py/ciscoconfparse/"
license=('GPL3')
depends=('python' 'python-colorama' 'python-passlib' 'python-dnspython')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c821c5130e2f6da9e5a27a4fe1bc4bea605a1cf4ab3d3fc6ce609f11fde391ab')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
