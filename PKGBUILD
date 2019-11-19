# Maintainer: Vinicius Correa <vinicius.correa at zoho dot com>

pkgname=stoqserver
pkgver=0.26.1
pkgrel=1
pkgdesc="A server for Stoq"
arch=('any')
url="https://www.stoq.com.br"
license=('GPL')
depends=('python' 'python-flask' 'python-flask-restful' 'python-gevent' 'python-netifaces' 'python-requests' 'python-twisted' 'postgresql')
install=${pkgname}.install
source=("https://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('66dd7c7a83b21e0138e28c38f27fe45c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
