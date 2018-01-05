# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgbase=python-iexfinance
pkgname=(python-iexfinance python2-iexfinance)
pkgver=0.2
pkgrel=1
pkgdesc="Python wrapper for the Investor's Exchange (IEX) Developer API"
url='https://addisonlynch.github.io/iexfinance/'
arch=(any)
license=(apache)
depends=(python)
makedepends=(python-setuptools python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/i/iexfinance/iexfinance-$pkgver.tar.gz")
sha256sums=('429420a2328d684d3fe9cc9223912d1d14d768a547dec60e9d3d5af2bacfa690')

build() {
  cp -a iexfinance-$pkgver iexfinance2-$pkgver
}

package_python-iexfinance() {
  cd iexfinance-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-iexfinance() {
  depends=(python2)

  cd iexfinance2-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
