# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.21.2
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/f3/6f/d9b9095f1fbd714c42c941f90288a5f4ac5552f6cc38224fa12646c2bcef/shodan-${pkgver}.tar.gz)
sha256sums=('ed3c38c749a5d77c935b226b6a7761e972269bd0d55c5c08526af73896aa6edd')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
