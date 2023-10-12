# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=python-pdpyras
pkgver=5.1.2
_name=pdpyras
pkgrel=1
pkgdesc="Low-level PagerDuty REST API Client in Python"
arch=('any')
url="https://github.com/PagerDuty/pdpyras"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6dc1e062148764d31e78bcfd76199e7680a39d2cb4e6025e5f5ffc974704b341')

build() {
   cd "$srcdir/$_name-$pkgver"
   python -m setuptools.launch setup.py build
}

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
