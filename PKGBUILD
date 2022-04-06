# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jc
pkgver=1.18.6
pkgrel=1
pkgdesc="serializes the output of command line tools to structured JSON"
arch=('any')
url='https://github.com/kellyjonbrazil/jc'
license=('MIT')
depends=('python-pygments' 'python-ruamel-yaml' 'python-xmltodict')
makedepends=('python-setuptools')
source=("https://github.com/kellyjonbrazil/jc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5347188ed55762a0325d5d8f6a1ff3ec221b4ad548dee085fadc5fe10366af93')

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
