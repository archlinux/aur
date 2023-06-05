# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-google-i18n-address
_pkgname=google-i18n-address
pkgver=3.0.0
pkgrel=1
pkgdesc='I18n address data packaged for Python'
arch=('any')
url=https://github.com/mirumee/google-i18n-address.git
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/mirumee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('387b4683936bbc19d1cf9a1dbf8f08610742f5ad3db72b681240b2e43a120c05')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
