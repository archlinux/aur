# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.10.2
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/3f/9e/b5d5b2073d763845be7ade4a464c868d2ad61c2a0e7a8681a346607a41d8/shodan-${pkgver}.tar.gz)
sha256sums=('019cc10a76e0bd28917e879dd095c7ba5ee2b70630bc052a5b79b93004e9b914')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
