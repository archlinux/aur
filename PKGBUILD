# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.8.1
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/fe/cd/5432361eb964e9cb1c6ceb1dc8aee751faf789627b58c7bc274e616e13a3/shodan-${pkgver}.tar.gz)
sha256sums=('2e50091f9df49f4a415f7ce03c27b50b0ef9badf3e766c57bf29271786a86b81')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
