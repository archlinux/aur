# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=python-pdpyras
pkgver=5.1.3
_name=pdpyras
pkgrel=1
pkgdesc="Low-level PagerDuty REST API Client in Python"
arch=('any')
url="https://github.com/PagerDuty/pdpyras"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('10220c4ab0553f3ee561112e691b3b54f43f2d96663616bf0627ada4a5610171')

build() {
   cd "$srcdir/$_name-$pkgver"
   python -m setuptools.launch setup.py build
}

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
