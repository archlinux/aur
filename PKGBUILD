# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Esteban V. Carnevale <alfplayer@mailoo.com>

pkgbase=python-polib
pkgname=('python-polib')
_pkgname=polib
pkgver=1.1.0
pkgrel=4
pkgdesc='A library to manipulate gettext files'
url='https://pypi.python.org/pypi/polib'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fad87d13696127ffb27ea0882d6182f1a9cf8a5e2b37a587751166c51e5a332a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
