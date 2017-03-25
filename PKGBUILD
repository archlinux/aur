# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-branca
_pkgname=branca
pkgver=0.2.0
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-vizualisation/branca"
license=('BSD')
checkdepends=('python-selenium' 'phantomjs')
depends=('python' 'python-jinja' 'python-nose')
options=(!emptydirs)
source=("https://pypi.python.org/packages/d0/ef/a499dd45ed54df7d1f5daab87b40a8d84928ede0f69ff02c5933e0bddd04/branca-$pkgver.tar.gz")
sha256sums=('327b0bae73a519f25dc2f320d8d9f1885aad2e8e5105add1496269d5391b8ea4')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    nosetests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
