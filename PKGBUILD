# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.5.5
pkgrel=1
pkgdesc="The official Python library for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama')
makedepends=('python')
source=(https://pypi.python.org/packages/ae/a3/d0ad25b4810770dcc167bc6f9a377741b8eb41685ece381816e23400376b/shodan-${pkgver}.tar.gz)
md5sums=('9618c452f769dd93a300bdecc9d8dc58')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
