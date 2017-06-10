# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.6.9
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/0c/d0/6f498effb90d7ec89b3e3397aa55865f236f320a70d75890523feef74c73/shodan-${pkgver}.tar.gz)
md5sums=('5a449a5031329aa025aa14d8e1391ea8')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
