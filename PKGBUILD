# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=python2-musicbrainzngs
pkgver=0.6
pkgrel=6
pkgdesc="Python2 bindings for Musicbrainz' NGS webservice"
arch=('any')
url="https://github.com/alastair/python-musicbrainzngs"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("${pkgname/2/}-${pkgver}.tar.gz::https://github.com/alastair/${pkgname/2/}/archive/v${pkgver}.tar.gz")
sha256sums=('ec447bcab906fe7c4dbd714a1dff1b00adcd20d0011968df1a740e6b1fb09cb5')

build() {
  cd "${pkgname/2/}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname/2/}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize='1'

  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
