# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.19.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/a5/8b/c62f16523a14ac8df38745b75b2d498566c6ad87d7339d25d489261320be/shodan-${pkgver}.tar.gz)
sha256sums=('9d8bb822738d02a63dbe890b46f511f0df13fd33a60b754278c3bf5dd5cf9fc4')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
