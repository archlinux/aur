# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pmdarima
pkgname=python-$_pkgname
pkgver=1.8.5
pkgrel=1
pkgdesc="ARIMA estimators for Python"
arch=('x86_64' 'aarch64')
url="https://alkaline-ml.com/pmdarima"
license=('MIT')
depends=('python-scikit-learn' 'python-statsmodels' 'python-urllib3')
makedepends=('python-setuptools' 'cython')
source=($pkgname-$pkgver.tar.gz::"https://github.com/alkaline-ml/pmdarima/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6145dca73d5e3388460b0ed09afca9b38be944910099bd526a5e53d8eee4d6b8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
