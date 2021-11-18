# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jc
pkgver=1.17.1
pkgrel=1
pkgdesc="serializes the output of command line tools to structured JSON"
arch=('any')
url='https://github.com/kellyjonbrazil/jc'
license=('MIT')
depends=('python-pygments' 'python-ruamel-yaml' 'python-xmltodict')
makedepends=('python-setuptools')
source=("https://github.com/kellyjonbrazil/jc/archive/v${pkgver}.tar.gz")
sha256sums=('0970a4a1f92896db34d248bea511e656dc494d3ba8633beafd6b5728f7068af5')

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
