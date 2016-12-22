# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.6.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/00/70/dc9b0ceada3a3aa4b2e5ebed23331ca9a61539e063eb87ed5aa48890d708/shodan-${pkgver}.tar.gz)
md5sums=('d910e3cfa1109665b13a19f465598e6c')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
