# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.11.1
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/ff/61/3545b2d9476f4b83536506b6a4ac6ecde8fcb09481d7b23cb334298dc4b2/shodan-${pkgver}.tar.gz)
sha256sums=('f93b7199e89eecf5c84647f66316c2c044c3aebfc1fe4d9caa43dfda07f74c4e')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
