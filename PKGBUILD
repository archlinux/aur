# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-click-spinner
_pkgname=click-spinner
pkgver=0.2.0
pkgrel=1
pkgdesc="Spinner for Click"
arch=("any")
url="https://github.com/click-contrib/click-spinner"
license=('MIT')
depends=('python-click')
makedepends=('python-setuptools')
source=("https://github.com/click-contrib/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE")
sha256sums=('557fbe3ae58921cec0fe6d530cc0f152f8d08e71e647e6470bbb4fb3320d69c4'
            'c5c1fd90ca653c10b25eb2f8ce55d41654515ccf0254f13e24c8a982a5ad5a5c')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
