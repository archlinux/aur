# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-fy"
_pkgname=${pkgname#python-}
pkgver=0.12.2
pkgrel=1
pkgdesc="Convert received raw data from crypto exchange API endpoints into well-formed python dictionaries"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-requests' 'python-ujson')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('80e92ac25a9c905fa4ce6495d086026fb342138cba220eb4c2b6f5342d1b6d8f')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
