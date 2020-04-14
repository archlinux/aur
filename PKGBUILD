# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.23.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/d2/c9/66fed4035127aa4aebfd02646306b8770bf0e8c169847e19f35e0f931892/shodan-${pkgver}.tar.gz)
sha256sums=('31b0740ffaf7c5196a26a0b1edf7d271dffe54ea52bb1b34ba87aa231b5c339b')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
