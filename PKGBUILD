# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Liam Timms <timms5000@gmail.com>

_pkgname=jenkspy
pkgname=python-$_pkgname
pkgver=0.4.1
pkgrel=1
pkgdesc='Compute Natural Breaks in Python (Fisher-Jenks algorithm) '
arch=('any')
url='https://github.com/mthh/jenkspy'
license=('MIT')
depends=('python-numpy' 'python' 'cython')
makedepends=('python-setuptools' 'python-build' 'python-installer')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mthh/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('603c8ea88ebd7433bc2b74c9e149e938b0c6c15bebdc8bf7e36db8dccd0ba5e00ba11e624d13517fbbd6d466b8eb99baec7834d9fc7cdf2f02dd0c281433fc76')


build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

