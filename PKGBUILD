# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.10.3
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/54/7c/2dd1382f1d076009cbcc157828232fdb74eee6b64d1c38b1feb3b79ade4e/shodan-${pkgver}.tar.gz)
sha256sums=('a0179a816081c9bfc669890d27c94cfdb797c3439f6ba483c9afc37b9ac19884')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
