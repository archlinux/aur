# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.10.1
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/41/58/d9c0558cdab11751e99d000aeeb862d50def59d33fec01bb859d96eec3c6/shodan-${pkgver}.tar.gz)
sha256sums=('0a611d2b3f9025870d54abe0d9d378fa517fb0360d468cf0221c58c584f80d1f')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
