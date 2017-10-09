# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.7.5
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/07/9d/0c5621773acf86ac4625f98c3d8c40132aca8d5675ed032674d6ffeff196/shodan-${pkgver}.tar.gz)
md5sums=('2890d5f9d91fe778549c57f5e8747ec3')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
