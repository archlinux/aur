# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.24.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/49/7f/2e1ec600f21b3f84372c1f56df600bc956e5201ac18321b45821051ac248/shodan-${pkgver}.tar.gz)
sha256sums=('0b5ec40c954cd48c4e3234e81ad92afdc68438f82ad392fed35b7097eb77b6dd')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
