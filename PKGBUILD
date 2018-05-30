# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.8.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/ba/6a/e148077f25c5f55c524f43fdd86a3f91bbf1364a3afab7b0ba4cccb41b88/shodan-${pkgver}.tar.gz)
sha256sums=('2793c9286976ef4e3a1253676c876201a7cc6386d7a7e971102a46264139f9d1')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
