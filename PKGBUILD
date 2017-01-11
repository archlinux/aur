# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.6.4
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/e2/b5/003f6f85782814dfecaf5ae12a89a98566f503230be44acceea2bb9ad627/shodan-${pkgver}.tar.gz)
md5sums=('ea1143a241cc09cd7c3b0bb8b6a0e95a')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
