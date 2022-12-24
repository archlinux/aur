# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specterext-spectrum
pkgver=0.3.0
pkgrel=1
pkgdesc="This is a electrum-adapter. It exposes a Bitcoin-Core style API while using an electron API in the backend."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-embit' 'python-flask' 'python-flask-sqlalchemy' 'python-psycopg2' 'python-pytest')
source=("https://github.com/cryptoadvance/spectrum/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('472ab58c5ed548e934da8c75ce553d69a843f3c23f66537705779aadb8d770bc')

build() {
  cd "spectrum-${pkgver}"
  python setup.py sdist bdist_wheel
}

package() {
  cd "spectrum-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license since the package doesn't include it - No License File
  #install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
