# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sncli
pkgver=0.4.1
pkgrel=1
pkgdesc="Simplenote CLI"
arch=('any')
url='https://github.com/insanum/sncli'
license=('MIT')
depends=('python-urwid'
				 'python-requests'
				 'python-simperium')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}