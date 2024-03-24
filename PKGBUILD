# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-py010parser
_pkgname=py010parser
pkgver=0.1.18
pkgrel=3
pkgdesc='Library parsing 010 templates into an AST.'
arch=(any)
url=https://github.com/d0c-s4vage/py010parser
license=('custom')
depends=(python python-six python-regex)
makedepends=(python-setuptools)
source=(https://github.com/d0c-s4vage/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=(c0b236be2bfe464aa8db3ab98ce7db67)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i "s/{{VERSION}}/${pkgver}/g" setup.py
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
