# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ijson
pkgver=3.1.4
pkgrel=1
pkgdesc="Iterative JSON parser with Pythonic interface"
arch=(x86_64)
url="https://github.com/ICRAR/ijson"
license=('custom')
depends=('python' 'yajl')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ICRAR/ijson/archive/v${pkgver}.tar.gz")
sha256sums=('fd12968282cb60579d7ac61ba2bee4c4771101a56e75890284aa277a7ec67018')

build() {
  cd ijson-$pkgver
  python setup.py build
}

package(){
  cd ijson-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

# vim:ts=2:sw=2:et:
