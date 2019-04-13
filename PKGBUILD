# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.12.1
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/eb/d4/89027c73ea309dc69b45e76dc6d6dbd869a20b9be06ab104027ac4597dbc/shodan-${pkgver}.tar.gz)
sha256sums=('c30baebce853ad67677bf002dde96a1ca1a9729bdd300fbb3c5e5d889547a639')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
