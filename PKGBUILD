# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jc
pkgver=1.17.4
pkgrel=1
pkgdesc="serializes the output of command line tools to structured JSON"
arch=('any')
url='https://github.com/kellyjonbrazil/jc'
license=('MIT')
depends=('python-pygments' 'python-ruamel-yaml' 'python-xmltodict')
makedepends=('python-setuptools')
source=("https://github.com/kellyjonbrazil/jc/archive/v${pkgver}.tar.gz")
sha256sums=('f5bb5eed4e67e59b996fc5448d55c2a7183a10681e7696c197aab1a5f1eff005')

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
