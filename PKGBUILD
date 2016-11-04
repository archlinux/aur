# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.5.6
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/7a/4b/345ef5dfec3157f46e222b700f459f28b90090a6d199257dcb04e9440ba0/shodan-${pkgver}.tar.gz)
md5sums=('1ec668cac5c953930e775f7ba6fc1e22')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
