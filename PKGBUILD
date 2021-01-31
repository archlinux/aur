# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.25.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/c8/87/ba5671b333f1016a306f2e762fe762fbc9c3696614f6db3ce6171641005f/shodan-${pkgver}.tar.gz)
sha256sums=('7e2bddbc1b60bf620042d0010f4b762a80b43111dbea9c041d72d4325e260c23')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
