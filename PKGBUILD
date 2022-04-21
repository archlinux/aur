# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-google-i18n-address
_pkgname=google-i18n-address
pkgver=2.5.1
pkgrel=1
pkgdesc='I18n address data packaged for Python'
arch=('any')
url=https://github.com/mirumee/google-i18n-address.git
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/mirumee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c84c3415f30760fce9a93494465d638a64e4a6bb737c01601ad845650bc663b9')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
