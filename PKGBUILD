# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jc
pkgver=1.11.8
pkgrel=1
pkgdesc="serializes the output of command line tools to structured JSON"
arch=('any')
url='https://github.com/kellyjonbrazil/jc'
license=('MIT')
depends=('python-wheel')
makedepends=('python-setuptools')
source=("https://github.com/kellyjonbrazil/jc/archive/v${pkgver}.tar.gz")
sha256sums=('9ab5da16aedd06c77585e39e2062d5a730b9a66ea72df131eac65521cae92059')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
