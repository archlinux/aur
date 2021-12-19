# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=pdh
pkgver=0.2.3
pkgrel=1
pkgdesc="Pagerduty CLI for humans"
arch=('any')
url="https://github.com/mbovo/pdh"
license=('APACHE')
depends=('python-click' 'python-colorama' 'python-rich' 'python-pyaml' 'python-pdpyras')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3586cabd57b5c569ae07a2fb50f2ad40f1fa5fef40f9c3ac4a84454790061805')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m setuptools.launch setup.py build
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
