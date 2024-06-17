# Maintainer: Andy Botting <andy@andybotting.com>
_ver=87ccfb3d945c5867bfa92d55aad03dc98466a2aa  # v1.3.9 but not tagged
pkgname=python-freshdesk
pkgver=1.3.9
pkgrel=1
pkgdesc='A Python client for the Freshdesk helpdesk API'
arch=(any)
url=https://github.com/sjkingo/python-freshdesk
license=(BSD)
depends=(python-requests python-dateutil)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-mock python-responses)
source=("https://github.com/sjkingo/python-freshdesk/archive/$_ver.zip")
sha512sums=('041bc1e309164790c635ce7b481da30d68b17caab104555a824f7dbbbf9651f04caebfab2bb5cf327d27a5de0f83e3a825518a01260ba07846a699fa12de4d78')

build() {
  cd $pkgname-$_ver
  python setup.py build
}

check() {
  cd $pkgname-$_ver
  pytest -v
}

package() {
  cd $pkgname-$_ver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
