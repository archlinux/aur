# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.10.4
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/24/36/87e5e4cab32ffeba1c7304f7dadc00b93491bc3b3de0b599ccacfa3b3671/shodan-${pkgver}.tar.gz)
sha256sums=('c40abb6ff2fd66bdee9f773746fb961eefdfaa8e720a07cb12fb70def136268d')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
