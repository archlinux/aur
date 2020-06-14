# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mohamed Sobh <mohamed.alhusieny@gmail.com>

pkgname=python-zipline
pkgver=1.3.0
pkgrel=1
pkgdesc="A backtester for financial algorithms."
arch=('any')
url="https://www.zipline.io"
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
sha256sums=('19b6607845d8d9dfa51c5679c65a143a04172f76fff70a58f9a835a69a25fbf9')

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
