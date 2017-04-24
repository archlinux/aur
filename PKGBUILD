# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.6.5
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/ae/c8/510acdc63b093cca499023a5d33079c000c743ab2f526f37848b4a63a2f7/shodan-${pkgver}.tar.gz)
md5sums=('de98d72a123cd8349e9aaf3d863c4161')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
