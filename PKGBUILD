# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname='pymilter'
pkgver='1.0'
pkgrel='1'
pkgdesc='Python interface to sendmail milter API'
arch=('any')
url='http://www.bmsi.com/python/milter.html'
license=('GPL')
depends=('python2')
makedepends=('libmilter')
source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("93a8f31b06c4a7f04e6f9b69f8d7357ba750819e6348177536b23255616e8937")

build() {
  pushd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
  popd
}

package() {
  pushd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
  popd
}
