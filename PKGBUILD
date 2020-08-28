# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-google-i18n-address
_pkgname=google-i18n-address
pkgver=2.4.0
pkgrel=1
pkgdesc='I18n address data packaged for Python'
arch=('any')
url=https://github.com/mirumee/google-i18n-address.git
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/mirumee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a3591df6aedca1c31b1978bf9b767402a154787ef7a1c2b845726762832a88fd')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
