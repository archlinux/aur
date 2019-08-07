# Maintainer: Alexandre Moine <alexandre@moine.me>
# Contributor: TingPing <tingping@tingping.se>

pkgname=zanata-python-client
pkgver=1.5.3
pkgrel=1
pkgdesc='Client for managaging translations on Zanata'
arch=('any')
url='http://zanata.org/'
license=('LGPL2.1')
depends=('python-future' 'python-httplib2' 'python-polib' 'python-lxml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/zanata/zanata-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('f7caae883d29e70e189b494d8b3681b90b1c2d9c31e1eea01930d8748f94580f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
