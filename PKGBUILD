# Maintainer: Mohamed Sobh <mohamed.alhusieny@gmail.com>
pkgname=python-zipline
pkgver=0.7.0
pkgrel=1
pkgdesc="A backtester for financial algorithms."
arch=('any')
url="www.zipline.io"
license=('APACHE')
depends=(
  'python>=3.3'
  'python-numpy>=1.6.0'
  'python-pandas>=0.9.0'
  'python-dateutil>=2.1'
  'python-pytz'
  'python-logbook'
  'python-requests'
  'ta-lib'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${pkgname:7:1}/${pkgname:7}/${pkgname:7}-${pkgver}.tar.gz")
md5sums=('62d45c3c0d9a624e787b7e413937f7b4')

build() {
  cd "$srcdir/${pkgname:7}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname:7}-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
