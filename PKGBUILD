# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.17.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/cb/bf/bff4f8e449a1ec1af01a484c3464eb1a3df9a046397019d47a9b436d54b4/shodan-${pkgver}.tar.gz)
sha256sums=('7fd50da0851b3a65316e38c2a24b99a9c20e0fbdab274d28fb7350a59b5007ea')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
