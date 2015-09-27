# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-pfp
_pkgname=pfp
pkgver=0.1.14
pkgrel=1
pkgdesc='An interpreter for 010 template scripts.'
arch=(any)
url=https://github.com/d0c-s4vage/pfp
license=('MIT')
depends=(python-py010parser python-six python-intervaltree)
makedepends=(python-setuptools)
source=(https://github.com/d0c-s4vage/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=(a8e83d72647def9a700f2ce4cae56f7a)

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
