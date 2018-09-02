# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.10.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/fe/cd/5432361eb964e9cb1c6ceb1dc8aee751faf789627b58c7bc274e616e13a3/shodan-${pkgver}.tar.gz)
source=(https://files.pythonhosted.org/packages/ec/f2/d1a1eeba0aa047f2f288bb119ba8a2e82095e3efc2e71ece84d2d5dd15ed/shodan-${pkgver}.tar.gz)
sha256sums=('c5d6b8c616b7d5ded91bc9e348ec11b238c9e86a8584a27cde0d6a8a0b7fd97a')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
