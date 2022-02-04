# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jc
pkgver=1.18.2
pkgrel=1
pkgdesc="serializes the output of command line tools to structured JSON"
arch=('any')
url='https://github.com/kellyjonbrazil/jc'
license=('MIT')
depends=('python-pygments' 'python-ruamel-yaml' 'python-xmltodict')
makedepends=('python-setuptools')
source=("https://github.com/kellyjonbrazil/jc/archive/v${pkgver}.tar.gz")
sha256sums=('9daec57ae1f78f3bd7fa9f5e94b02d8aecae3a6a04d13325c73d24bbcde43bf7')

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
