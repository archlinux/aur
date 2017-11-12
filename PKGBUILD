# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='pymilter'
pkgver='1.0.2'
pkgrel='1'
pkgdesc='Python interface to sendmail milter API'
arch=('any')
url="https://github.com/sdgathman/${pkgname}"
license=('GPL')
depends=('python2')
makedepends=('libmilter')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f513053f5fc9b0c31d886d8412a411bdc958786a673d7071b1bd521498b01153')

build() {
  pushd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python2 setup.py build
  popd
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
