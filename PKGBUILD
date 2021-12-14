# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=python-pdpyras
pkgver=4.3.0
_name=pdpyras
pkgrel=1
pkgdesc="Low-level PagerDuty REST API Client in Python"
arch=('any')
url="https://github.com/PagerDuty/pdpyras"
license=('MIT')
depends=('python-requests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dd5f010f40b85282d8aabbd6b7aaee4018651667539f45b9055619ac40a5aefe')

build() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py build
}

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
