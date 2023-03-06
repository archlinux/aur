# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Esteban V. Carnevale <alfplayer@mailoo.com>

pkgbase=python2-polib
pkgname=('python2-polib')
_pkgname=polib
pkgver=1.2.0
pkgrel=1
pkgdesc='A library to manipulate gettext files'
url='https://pypi.python.org/pypi/polib'
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("${pkgbase/2/}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f3ef94aefed6e183e342a8a269ae1fc4742ba193186ad76f175938621dbfc26b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
