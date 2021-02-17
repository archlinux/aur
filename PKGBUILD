# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_supply_forecast
_name=trytond_stock_supply_forecast
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add forecast to supply computation"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9a05eec7731b503065a38db0ebfe61842504de54b156a1b0643d4db411e0b031')
sha512sums=('0579785eb122e0a4c3cbf019c98df422ae85fac9199a77655f0bef220916e550791113bd24e936233bf1cc8c107b5aa930aab2e5685954ccfd9afaffd824a688')
b2sums=('b99d79f4d5685f934e225b2183acb9fc8483950c7684a8e22fafcba3bb4d7923923c84355f4729f93e411a1efa5225ccc3d70f76263da4680db0c46cc77b993f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
