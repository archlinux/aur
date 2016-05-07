# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.5.3
pkgrel=1
pkgdesc="The official Python library for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama')
makedepends=('python')
source=(https://pypi.python.org/packages/6a/77/1549623c67d67efc9e4a854ca7e1ebfcb9de3f3ba2658706401d052725a0/shodan-${pkgver}.tar.gz)
md5sums=('41e09552d261d3e3ddbc23a38f0517b7')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
