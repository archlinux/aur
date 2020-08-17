# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jc
pkgver=1.13.4
pkgrel=1
pkgdesc="serializes the output of command line tools to structured JSON"
arch=('any')
url='https://github.com/kellyjonbrazil/jc'
license=('MIT')
depends=('python-pygments' 'python-ruamel-yaml' 'python-xmltodict')
makedepends=('python-setuptools')
source=("https://github.com/kellyjonbrazil/jc/archive/v${pkgver}.tar.gz")
sha256sums=('35b1d86c785323f7f5fca4b542f674cad67f52c073404f666dba8c6718c5667b')

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
