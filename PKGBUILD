# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.7.4
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/13/3d/65cbf07597ffc2012e25297399730d26f4e22a90b9df5784db6096d743ba/shodan-${pkgver}.tar.gz)
md5sums=('b7f4bfd3aa1b1e44081970907db3c0e2')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
