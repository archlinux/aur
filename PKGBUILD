# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-gps3
pkgver=0.30.4
pkgrel=1
pkgdesc='Python 2.7 - 3.5 interface to gpsd'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wadda/gps3/archive/fackme.tar.gz")
sha256sums=('d6d022854305f0c7b492980f84643d583ed7c32b7b7edbaf2e4747efbd3fb135')

build() {
  cd "gps3-fackme"
  python setup.py build
}

package() {
  cd "gps3-fackme"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: