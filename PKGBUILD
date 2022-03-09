# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-fy"
_pkgname=${pkgname#python-}
pkgver=0.12.0
pkgrel=1
pkgdesc="Convert received raw data from crypto exchange API endpoints into well-formed python dictionaries"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-requests' 'python-ujson')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b3630f4fa56aa721a67d985bc94f4daec451a385c455657c1a6c09a81e38b173')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
