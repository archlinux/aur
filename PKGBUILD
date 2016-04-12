# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.5.2
pkgrel=1
pkgdesc="The official Python library for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama')
makedepends=('python')
source=(https://pypi.python.org/packages/source/s/shodan/shodan-${pkgver}.tar.gz)
md5sums=('8c9e4b2a22c9fd004d21d98e6370cc4e')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
