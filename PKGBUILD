# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=python-pdpyras
pkgver=4.5.0
_name=pdpyras
pkgrel=1
pkgdesc="Low-level PagerDuty REST API Client in Python"
arch=('any')
url="https://github.com/PagerDuty/pdpyras"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0d09ab50ddd220c1b77f692ab68e1b4324c97811cdefd9c6e84665d5417e716e')

build() {
   cd "$srcdir/$_name-$pkgver"
   python -m setuptools.launch setup.py build
}

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
