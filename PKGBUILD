# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.22.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/40/2a/58e86678c50c96396a64190f05513a4f2f211332da5f6ed13e2e596c7c5c/shodan-${pkgver}.tar.gz)
sha256sums=('a9f098c2d24cf685b6d4a4bd46c7f56653c84f777f20d1a853cfd7672f68f35d')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
