# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Esteban V. Carnevale <alfplayer@mailoo.com>

pkgbase=python-polib
pkgname=('python-polib')
_pkgname=polib
pkgver=1.2.0
pkgrel=1
pkgdesc='A library to manipulate gettext files'
url='https://pypi.python.org/pypi/polib'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f3ef94aefed6e183e342a8a269ae1fc4742ba193186ad76f175938621dbfc26b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
