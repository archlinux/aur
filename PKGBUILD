pkgname=python-ciscoconfparse
_pkgname=ciscoconfparse
pkgver=1.5.1
pkgrel=1
pkgdesc="Parse, Audit, Query, Build, and Modify Cisco IOS-style configurations "
arch=('any')
url="http://www.pennington.net/py/ciscoconfparse/"
license=('GPL3')
depends=('python' 'python-colorama' 'python-passlib' 'python-dnspython')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3f0ca586d24d5ec8368f2659b84fe9800cfbf09ae3925b15ca4164084d53d648')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
