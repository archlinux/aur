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
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('a2bf528715022227df4a852a2bb17b29')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}