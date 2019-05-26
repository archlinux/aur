# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='pymilter'
pkgver='1.0.4'
pkgrel='1'
pkgdesc='Python interface to sendmail milter API'
arch=('any')
url="https://github.com/sdgathman/${pkgname}"
license=('GPL')
depends=('python2')
makedepends=('libmilter')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f871e29d2bb4bb192e9d9a1f205278f55cb0092a6c8c84ab698171924e4d2a2c')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
