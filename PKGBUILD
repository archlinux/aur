# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.6.3
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama' 'python-click-plugins')
makedepends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/65/57/913f5d4fb84dd35bec34a6c98df55dda73193103f14278b706cd13818ed1/shodan-${pkgver}.tar.gz)
md5sums=('c641a39da0aeaaa23ddb5611e9e44d88')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
