# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='pymilter'
pkgver='1.0.5'
pkgrel='1'
pkgdesc='Python interface to sendmail milter API'
arch=('any')
url="https://github.com/sdgathman/${pkgname}"
license=('GPL')
depends=('python')
makedepends=('libmilter')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8093032829ddd53261dbe2991959514156767f3785dfb095ed9b17f3fba965e1')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
