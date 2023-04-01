# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>

pkgname='python-jdcal'
pkgver=1.4.1
pkgrel=8
pkgdesc="Julian dates, from proleptic Gregorian and Julian calendars"
arch=('any')
url="https://github.com/phn/jdcal"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/phn/jdcal/archive/v${pkgver}.tar.gz")
sha256sums=('6cb87959fb9293bdd577967419af735a1a0aee3ce778c443acb219b2668c6597')

build() {
  cd "$srcdir"/jdcal-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/jdcal-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
