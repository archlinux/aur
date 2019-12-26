# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.21.1
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/5d/68/2e35c893eecea964a7e040c6cf73ee8f98dff995f19785579b39c90fdef2/shodan-${pkgver}.tar.gz)
sha256sums=('834dfd084fed290b2b445545b0d1cac7822f3c0ed6ba09707efb1716bb485ede')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
