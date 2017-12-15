# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.7.7
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/21/5b/2285d58661d73f545e77f61fcfdae1bacfcf84560025acf2c27e2e3fa786/shodan-${pkgver}.tar.gz)
md5sums=('208d814e29183560253076900b9e3336')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
