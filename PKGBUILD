# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.12.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/da/09/879184a891bd8f76701e85e000b3b0d6c1affebb417fcdf6e586194acb56/shodan-${pkgver}.tar.gz)
sha256sums=('2473ab5f5ba5b13db25e939c37bb74f9b6ec7cab44e272c1ac8049d7a4bdcb23')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
