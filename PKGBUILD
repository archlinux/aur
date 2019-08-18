# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.15.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/1d/2c/87752f94363e27d7604465021ea2943280b16908139d4b86db1f82c64079/shodan-${pkgver}.tar.gz)
sha256sums=('7903d110376dac9d3b7c046a1a1bd285e0f63a73649a700e80bbca3b698bb5bf')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
