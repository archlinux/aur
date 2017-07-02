# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.7.1
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/ae/ad/e02d17c36c5291c482bb6e458863552bcd8b7220c9dba40b75b863f9e642/shodan-${pkgver}.tar.gz)
md5sums=('6b6bc7e40f2c27f6714f9cc3b5707014')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
