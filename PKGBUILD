# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pmdarima
pkgname=python-$_pkgname
pkgver=2.0.0
pkgrel=1
pkgdesc="ARIMA estimators for Python"
arch=('x86_64' 'aarch64')
url="https://alkaline-ml.com/pmdarima"
license=('MIT')
depends=('python-scikit-learn' 'python-statsmodels' 'python-urllib3')
makedepends=('python-setuptools' 'cython')
source=($pkgname-$pkgver.tar.gz::"https://github.com/alkaline-ml/pmdarima/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3db11289e2f94ea047dda974b92ff172901f28cd51423b206dc9e57e9710143')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
