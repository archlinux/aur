# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-google-i18n-address
_pkgname=google-i18n-address
pkgver=2.3.5
pkgrel=2
pkgdesc='I18n address data packaged for Python'
arch=('any')
url=https://github.com/mirumee/google-i18n-address.git
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/mirumee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('235d619fdf126d9c8607e0bd3ad86784eed6d2357e148ae647e48c66549d01a7')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
