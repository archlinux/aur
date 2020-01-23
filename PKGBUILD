# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.21.3
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/f9/46/b3aaa376a5c3e5ad15b61bb0e2914477926e900885ee7ce482fe4f1cd237/shodan-${pkgver}.tar.gz)
sha256sums=('3f56899f533ab001775adcdae181ce80accad53cd298d710c844bd26c76c78d5')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
