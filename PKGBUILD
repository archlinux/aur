# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

_name=currencyconverter
pkgname=python-currencyconverter
pkgver=0.18.23
pkgrel=1
pkgdesc="A currency converter using the European Central Bank data."
arch=(any)
url="https://pypi.org/project/CurrencyConverter/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
conflicts=('python3-currencyconverter')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6a6546e7aacf9478d4ff129e95ba1bea5e90987db56daca99985cf84d4e88a7a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
