# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=python-google-i18n-address
_pkgname=google-i18n-address
pkgver=3.1.1
pkgrel=1
pkgdesc='I18n address data packaged for Python'
arch=('any')
url=https://github.com/mirumee/google-i18n-address.git
license=('custom')
depends=('python')
makedepends=(
	'python-setuptools'
	'python-hatchling'
)
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/mirumee/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('081a0b6b23c6846830debf3204d554d6312ba42f319f1d6395e5011b3527646c')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
